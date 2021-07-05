## Usage

     curl -k https://example.com           # Ignore SSL errors
     curl -s https://example.com           # Silence curl download infos, just content

     curl -X PUT --data-binary @myinput.json https://example.com/api/v1/endpoint     # use data from file

### Using curl metrics

You can use curl to measure resolving, time to connect, time to first byte and total time like this:

- Issue sequential requests (each with new connection)

      while true; do
         curl -w "$(date +%FT%T)    dns %{time_namelookup}    connect %{time_connect}   firstbyte %{time_starttransfer}   total %{time_total}   HTTP %{http_code}\n" -o /dev/null -s "https://example.com"
         sleep 1
      done

- Issue sequential HTTP/1.1 requests on 1 connection

      curl -w "$(date +%FT%T)    dns %{time_namelookup}    connect %{time_connect}   firstbyte %{time_starttransfer}   total %{time_total}   HTTP %{http_code}\n" --keepalive -K <(printf 'url="https://example.com/"\n%.0s' {1..10000})
