## Usage

     curl -k https://example.com           # Ignore SSL errors
     curl -s https://example.com           # Silence curl download infos, just content
     
     curl -X PUT --data-binary @myinput.json https://example.com/api/v1/endpoint     # use data from file
     
     # POST with data
     curl -XPOST --data-binary @myinput.txt       https://example.com/api
     curl -d '{ "key": "value", "some": "json" }' https://example.com/api
     curl -d 'param=key&param=key'                https://example.com/api     # application/x-www-form-urlencoded
     
     # HEAD request
     curl -I https://example.com/file
     
## Timeouts

     -m <seconds>                  # Maximum timeout for entire request
     --connect-timeout <seconds>   # Maximum connect timeout

## Secure Authentication with curl

### Don't do insecure auth

These credential passing methods might be insecure (depending on your use case) as they expose the password in the process list.

1. Via simple basic auth via URL (i.e. `https://<user>:<pwd>@<server>`) 
2. Via `-u "<user>:<pwd>"`

### Use piped config

    echo '-u "<user>:<pwd>"' | curl -K "https://example.com" -K-

### Use .netrc
     
     # Variants with .netrc
     curl -n "https://example.com"                 # Mandatory auth via .netrc
     curl --netrc-optional "https://example.com"   # Optional auth via .netrc
     
     # On-the-fly .netrc
     curl --netrc-file <(echo "example.com <user> <pwd>") "https://example.com"


## Using curl metrics

You can use curl to measure resolving, time to connect, time to first byte and total time like this:

- Issue sequential requests (each with new connection)

      while true; do
         curl -w "$(date +%FT%T)    dns %{time_namelookup}    connect %{time_connect}   firstbyte %{time_starttransfer}   total %{time_total}   HTTP %{http_code}\n" -o /dev/null -s "https://example.com"
         sleep 1
      done

- Issue sequential HTTP/1.1 requests on 1 connection

      curl -w "$(date +%FT%T)    dns %{time_namelookup}    connect %{time_connect}   firstbyte %{time_starttransfer}   total %{time_total}   HTTP %{http_code}\n" --keepalive -K <(printf 'url="https://example.com/"\n%.0s' {1..10000})
