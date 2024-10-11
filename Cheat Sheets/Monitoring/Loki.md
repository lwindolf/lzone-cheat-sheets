## Debugging

    curl localhost:3100/config      # Dump active config

## Log Query Examples

Convert log string to json

    {label="match"} | json

Reduce log lines to exception names

    {label="match"} |~ "Exception:" | json | regex(.message, '.*\\s+(\\S*Exception):')

Reduce log lines to exception names (without regex for Loki <2.4)

    {label="match"} |~ "Exception:" | json | line_format `{{ regexReplaceAll ".*\\s+(\\S*Exception):.*$" .message "${1}" }}`

Extract a text part into a label for example exceptions:

    {kubernetes_namespace_name="my-namespace-1"}
    |= `Exception:`
    | regexp "(?P<exception>\\w+Exception: [^\"]+)"
    | label_format exception=`{{ .exception }}`
