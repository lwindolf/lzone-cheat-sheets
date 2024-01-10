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
  var cheatsheets = require('./cheat-sheets.json');

  async function update(name) {
    let repo = cheatsheets[name];
    let regex = new RegExp((repo.filePattern?repo.filePattern:"^(.+).md$"));

    // fetch default branch first
    let data = await fetch(`https://api.github.com/repos/${repo.github}`)
        .then((response) => response.json())
        .then((data) => { repoInfo = data; return fetch(`https://api.github.com/repos/${repo.github}/git/trees/${data.default_branch}?recursive=1`)})
        .then((response) => response.json());

    cheatsheets[name].files = data.tree
      .map((a) => a.path)
      .filter((path) => regex.test(path));
  }

  for(const name of Object.keys(cheatsheets)) {
    update(name);
  }

  console.log(cheatsheets);
EOT
) | node >cheat-sheets.json.new && mv cheat-sheets.json.new cheat-sheets.json
}

# Update README with a list of all cheat sheets defined
extra_cheat_sheets() {
  sed -i '/<!-- marker -->/,$ d' README.md
          
  (
    echo '<!-- marker -->'
            
    for directory in cheat-sheet examples; do
      oldgroup=
      printf "\n## %s Index\n\n" $(echo "$directory" | sed -e "s/\b\(.\)/\u\1/g")

      while IFS=/ read -r dot group file; do
        name="$(basename "$file" .md)"

        if [ "$oldgroup" != "$group" ]; then
          echo "<br/><span class='group'><b>$group</b></span>"
          oldgroup="$group"
        fi

        echo " | <a class='topic' href='https://lzone.de/$directory/$name'>$name</a>"
      done < <(cd $directory/ && find . -mindepth 2 -name "*.md" | LANG=C sort)
    done

    # Append extra sheet sheets
    printf "\n## Installable External Cheat Sheets\n\n"

    while read extra; do
      repo="https://github.com/$(jq -r '. | to_entries[] | select(.key == "'"$extra"'") | .value.github' extra-cheat-sheets.json)"
      printf " - [$extra]($repo)\n"
    done < <(jq -r ". | to_entries[] | .key" extra-cheat-sheets.json | LANG=C sort)

  ) >>README.md
}

cheat_sheets
extra_cheat_sheets
          
if [ "${GITHUB_RUN_NUMBER-}" != "" ]; then
	git config user.email "noreply@example.com"
	git config user.name "Create Index Workflow"
	git commit -m "Update index." README.md cheat-sheets.json || exit 0
	git push
fi

