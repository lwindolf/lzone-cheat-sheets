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

  # Check "last_updated" field to update stars/forks in extra-cheat-sheets.json
  max_updates=15
  jq -c '. | to_entries[]' extra-cheat-sheets.json | while read -r entry; do
    # Eventual consistency, do no update to much to not hit GitHub API quota
    if [ "$max_updates" -le 0 ]; then
      break
    fi

    key=$(echo "$entry" | jq -r '.key')
    value=$(echo "$entry" | jq -r '.value')
    last_updated=$(echo "$value" | jq -r '.last_updated // empty')

    if [ -z "$last_updated" ] || [ "$(date -d "$last_updated" +%s 2>/dev/null || echo 0)" -lt "$(date -d '30 days ago' +%s)" ]; then
      echo "Updating stats for $key"
      max_updates=$((max_updates - 1))

      repo=$(echo "$value" | jq -r '.github')
      if [ -n "$repo" ]; then
        repo_api_url="https://api.github.com/repos/$repo"
        repo_data=$(curl -s "$repo_api_url")
        stars=$(echo "$repo_data" | jq -r '.stargazers_count // 0')
        forks=$(echo "$repo_data" | jq -r '.forks_count // 0')

        jq --arg key "$key" --arg stars "$stars" --arg forks "$forks" --arg date "$(date -I)" \
            '.[$key] |= . + {stars: ($stars | tonumber), forks: ($forks | tonumber), last_updated: $date}' extra-cheat-sheets.json >tmp.json && mv tmp.json extra-cheat-sheets.json
          set +x
      fi
    fi
  done

  sed -i '/<!-- marker -->/,$ d' README.md
  (
    echo '<!-- marker -->'
            
    for directory in "Cheat Sheets"; do
      oldgroup=
      printf "\n## %s Index\n\n" "$(echo "$directory" | sed -e "s/\b\(.\)/\u\1/g")"

      while IFS=/ read -r dot group file; do
        name="$(basename "$file" .md)"

        if [ "$oldgroup" != "$group" ]; then
          echo "<br/><span class='group'><b>$group</b></span>"
          oldgroup="$group"
        fi

        echo " | <a class='topic' href='$directory/$group/$name.md'>$name</a>"
      done < <(cd "$directory/" && find . -mindepth 2 -name "*.md" | LANG=C sort)
    done

    # Append extra sheet sheets
    printf "\n## Installable External Cheat Sheets\n\n"
    printf "\nIt is impossible to cover all important topics, so [lzone.de](https://lzone.de) supports adding all the following content too.\n\n"
    printf "| Cheat Sheet | Stars | Type | Category |\n"
    printf "| --- | --- | --- | --- |\n"

    while read extra; do
      jq -r '. | to_entries[] | select(.key == "'"$extra"'") | .value | "| ['"$extra"'](https://github.com/"+(.github)+") | ⭐"+(.stars // "unknown" | tostring)+" | "+(.type)+" | "+(.category)+" | "' extra-cheat-sheets.json || true
    done < <(jq -r ". | to_entries[] | .key" extra-cheat-sheets.json | LANG=C sort) |\
    sed -e "s/| Tutorial |/| 💡 Tutorial |/g" \
        -e "s/| Book |/| 📕 Book |/g" \
        -e "s/| Awesome |/| 👍 Awesome |/g" \
        -e "s/| Documentation |/| 📄 Documentation |/g" \
        -e "s/| Cheat Sheet |/| 📓 Cheat Sheet |/g" \
        -e "s/| Interview |/| 💬 Interview |/g" \
        -e "s/| Runbook |/| 🤖 Runbook |/g" \
        -e "s/| Learning Path |/| 📚 Learning Path |/g"
  ) >>README.md
}

readme_update
          
if [ "${GITHUB_RUN_NUMBER-}" != "" ]; then
	git config user.email "noreply@example.com"
	git config user.name "Create Index Workflow"
	git commit -m "Update index." README.md || exit 0
	git push
fi

