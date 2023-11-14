#!/usr/bin/bash

set -euo pipefail

# Validate extra cheat sheets
jq . extra-cheat-sheets.json >/dev/null

if [ "${GITHUB_RUN_NUMBER-}" = "" ]; then
	git checkout README.md
fi

# Update README
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
          
if [ "${GITHUB_RUN_NUMBER-}" != "" ]; then
	git config user.email "noreply@example.com"
	git config user.name "Create Index Workflow"
	git commit -m "Update index." README.md || exit 0
	git push
fi

