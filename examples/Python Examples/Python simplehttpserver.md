## Simple HTTP server in Python3

To serve all HTML files from the current working directory

    python3 -m http.server

    python3 -m http.server 8080			# for different port
    python3 -m http.server 8080 --bind 127.0.0.1	# for secure binding


## Simple CGI server in Python3

    python3 -m http.server --cgi

## Simple HTTP server in Python2

To serve all HTML files from the current working directory

    python -m simplehttpserver

## Simple CGI server in Python2

    python -m CGIHTTPServer
