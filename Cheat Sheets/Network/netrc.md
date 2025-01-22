## Usage

The `.netrc` [file](https://www.gnu.org/software/inetutils/manual/html_node/The-_002enetrc-file.html) can be used to provide credentials to many CLI tools (e.g. wget, git).

Syntax:

    machine example.com
      login admin
      password verysecret

## Security

When using `.netrc` consider

- that your passwords are stored in plain text
- to use proper file permissions (e.g. 0600)
