---
related:
  cheat-sheet: ['pip']
---

## HowTo

- Interactive Console

      dir(<object>)            # print all members and methods

- [Ad-hoc Webserver](https://docs.python.org/2/library/simplehttpserver.html)

        import SimpleHTTPServer
        import SocketServer

        PORT = 8000

        Handler = SimpleHTTPServer.SimpleHTTPRequestHandler

        httpd = SocketServer.TCPServer(("", PORT), Handler)

        print "serving at port", PORT
        httpd.serve_forever()

-   Python - Value Dumping

        # For scalars and dictionaries
        print(vars(somevar))

        # For hashes
        from pprint import pprint
        pprint(h)

-   Python - PEP Linting

        pip3 install pyflakes
        pip3 install pep8

-   [Python - PyGtk Example Snippets](http://www.eurion.net/python-snippets/snippet/)
-   [Python - Google Coding Style Guide](http://google-styleguide.googlecode.com/svn/trunk/pyguide.html)
-   [Python - Django Best Practices](http://lincolnloop.com/django-best-practices/)
-   [Python - Types and
    Objects](http://www.cafepy.com/article/python_types_and_objects/python_types_and_objects.html#basic-concepts)
-   [Python - Debugging Memory
    Leaks](http://chase-seibert.github.io/blog/2013/08/03/diagnosing-memory-leaks-python.html)

