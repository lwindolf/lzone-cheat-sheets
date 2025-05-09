#!/usr/bin/bash

set -euo pipefail

# Validate JSON
jq . extra-cheat-sheets.json >/dev/null

# Reset stuff we want to modify
if [ "${GITHUB_RUN_NUMBER-}" = "" ]; then
	git checkout README.md
fi

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

