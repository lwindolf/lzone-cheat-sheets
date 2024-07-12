## Log Query Examples

Convert log string to json

    {label="match"} | json

Reduce log lines to exception names

    {label="match"} |~ "Exception:" | json | line_format `{{ regexReplaceAll ".*\\s+(\\S*Exception):.*$" .message "${1}" }}`

Reduce log lines to exception names (without regex)

    {label="match"} |~ "Exception:" | json | regex(.message, '.*\\s+(\\S*Exception):')
