#!/usr/bin/bash

set -euo pipefail

# Validate JSON
jq . cheat-sheets.json >/dev/null
jq . extra-cheat-sheets.json >/dev/null

# Reset stuff we want to modify
if [ "${GITHUB_RUN_NUMBER-}" = "" ]; then
	git checkout README.md cheat-sheets.json
fi

# Update default cheat sheet JSON with document structure
cheat_sheets() {
  (
  cat <<'EOT'
  async function run() {
    var cheatsheets = require('./cheat-sheets.json');

    for(const name of Object.keys(cheatsheets)) {
      let repo = cheatsheets[name];
      let regex = new RegExp((repo.filePattern?repo.filePattern:"^(.+).md$"));

      // fetch default branch first
      let data = await fetch(`https://api.github.com/repos/${repo.github}`)
          .then((response) => response.json())
          .then((data) => { repoInfo = data; return fetch(`https://api.github.com/repos/${repo.github}/git/trees/${data.default_branch}?recursive=1`)})
          .then((response) => response.json());

      cheatsheets[name].documents = data.tree
        .map((a) => a.path)
        .filter((path) => regex.test(path))
        .map((path) => {
          var tmp = path.match(regex);
          return { name: tmp[1], path };
        });

    }
    console.log(JSON.stringify(cheatsheets));
  }

  run();
EOT
  ) | node | jq >cheat-sheets.json.new && mv cheat-sheets.json.new cheat-sheets.json
}

# Build lunr search index
build_search_index() {
  (
  cat <<'EOT'
  async function run() {
    var cheatsheets = require('./cheat-sheets.json');
    var docs = {};

    for(const name of Object.keys(cheatsheets)) {
      let repo = cheatsheets[name];

      // Add entry for section title
      const j = Object.keys(docs).length;
      docs[j] = {
          doc: `${name}`,
          id: j,
          title: `${name}`,
          content: "",
          relUrl: `/#/${name}`,
          url: `/#/${name}`
      }

      // Add 1st level child entries
      repo?.documents.forEach((d) => {
          const j = Object.keys(docs).length;
          docs[j] = {
              doc: `${name}`,
              id: j,
              title: `${d.name}`,
              content: "",
              relUrl: `/#/${name}/${d.name}`,
              url: `/#/${name}/${d.name}`
          }
      });

    }
    console.log(JSON.stringify(docs));
  }

  run();
EOT
  ) | node | jq >search-index.json
}

# Update README with a list of all cheat sheets defined
readme_update() {
  sed -i '/<!-- marker -->/,$ d' README.md

  (
  cat <<'EOT'
  var cheatsheets = require('./cheat-sheets.json');
  var extra = require('./extra-cheat-sheets.json');
  var result = '<!-- marker -->\n\n';

  for(const name of ["Cheat Sheets"]) {
    let repo = cheatsheets[name];
    let oldgroup = "";
    let docs = {};

    result += `\n\n## ${name} Index\n\n`;

    for(let d of repo.documents) {
      d.path = d.path.replace(/\.md$/, '');
      let tmp = d.path.split(/\//);

      const dname = tmp[tmp.length-1];
      if(dname === 'README')
        continue;
      docs[dname] = { path: d.path, group: tmp[1] };
    }
    for(const dname of Object.keys(docs).sort((a,b) => {
	return docs[a].path.localeCompare(docs[b].path);
    })) {
      if (docs[dname].group !== oldgroup) {
        result += `\n<br/><b>${docs[dname].group}</b>`;
        oldgroup = docs[dname].group;
      }
      result += ` | <a href='https://lzone.de/#/LZone ${docs[dname].path}'>${dname}</a>`;
    }
  }

  result += '\n\n## Installable External Cheat Sheets\n\n';

  for(const dname of Object.keys(extra).sort()) {
    result += `- [${dname}](https://github.com/${extra[dname].github})\n`;
  }

  console.log(result);
EOT
  ) | node >>README.md
}

cheat_sheets
build_search_index
readme_update
          
if [ "${GITHUB_RUN_NUMBER-}" != "" ]; then
	git config user.email "noreply@example.com"
	git config user.name "Create Index Workflow"
  git add -u
  git add search-index.json
	git commit -m "Update index." README.md cheat-sheets.json search-index.json || exit 0
	git push
fi

