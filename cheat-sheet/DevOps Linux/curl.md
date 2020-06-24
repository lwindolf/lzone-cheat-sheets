## Usage

     curl -k https://example.com           # Ignore SSL errors
     curl -s https://example.com           # Silence curl download infos, just content

     curl -X PUT --data-binary @myinput.json https://example.com/api/v1/endpoint     # use data from file

