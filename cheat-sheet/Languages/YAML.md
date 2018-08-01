### Links

-   [YAML 1.2 Spec](http://www.yaml.org/spec/1.2/spec.html)
-   [Online YAML Linter (Ruby)](http://www.yamllint.com/)
-   [Online YAML Parser
    (Python)](http://yaml-online-parser.appspot.com/)
-   [kwalify - YAML schema validator
    (Ruby)](http://www.kuwata-lab.com/kwalify/)

### Syntax Snippets

+--------------------------------------+--------------------------------------+
| Scalars                              |     # scalar = value                 |
|                                      |     a: 1                             |
|                                      |     a: 1.234                         |
|                                      |     b: 'abc'                         |
|                                      |     b: "abc"                         |
|                                      |     b: abc                           |
|                                      |     c: false    # boolean type       |
|                                      |     d: 2015-04-05   # date type      |
|                                      |                                      |
|                                      |     # Enforcing strings              |
|                                      |     b: !str 2015-04-05               |
+--------------------------------------+--------------------------------------+
| Sequences                            |     # sequence                       |
|                                      |     array:                           |
|                                      |     - 132                            |
|                                      |     - 2.434                          |
|                                      |     - 'abc'                          |
|                                      |                                      |
|                                      |     # sequence of sequences          |
|                                      |     my_array:                        |
|                                      |     - [1, 2, 3]                      |
|                                      |     - [4, 5, 6]                      |
+--------------------------------------+--------------------------------------+
| Hashes                               |     # Nested hash                    |
|                                      |     my_hash:                         |
|                                      |       subkey:                        |
|                                      |         subsubkey1: 5                |
|                                      |         subsubkey2: 6                |
|                                      |       another:                       |
|                                      |         somethingelse: 'Important!'  |
|                                      |                                      |
|                                      |     # Hash of hashes                 |
|                                      |     my_hash: {nr1: 5, nr2: 6}        |
+--------------------------------------+--------------------------------------+
| HereDoc                              |     # block notation (newlines becom |
|                                      | e spaces)                            |
|                                      |     content:                         |
|                                      |       Arbitrary free text            |
|                                      |       over multiple lines stopping   |
|                                      |       after indentation changes...   |
|                                      |                                      |
|                                      |     # literal style (newlines are pr |
|                                      | eserved)                             |
|                                      |     content: |                       |
|                                      |       Arbitrary free text            |
|                                      |       over "multiple lines" stopping |
|                                      |       after indentation changes...   |
|                                      |                                      |
|                                      |     # + indicator (keep extra newlin |
|                                      | es after block)                      |
|                                      |     content: |+                      |
|                                      |       Arbitrary free text with two n |
|                                      | ewlines after                        |
|                                      |                                      |
|                                      |                                      |
|                                      |     # - indicator (remove extra newl |
|                                      | ines after block)                    |
|                                      |     content: |-                      |
|                                      |       Arbitrary free text without ne |
|                                      | wlines after it                      |
|                                      |                                      |
|                                      |                                      |
|                                      |     # folded style (folded newlines  |
|                                      | are preserved)                       |
|                                      |     content: >                       |
|                                      |       Arbitrary free text            |
|                                      |       over "multiple lines" stopping |
|                                      |       after indentation changes...   |
+--------------------------------------+--------------------------------------+
| Multiple Documents                   |     ---                              |
|                                      |     content: doc1                    |
|                                      |     ---                              |
|                                      |     content: doc2                    |
+--------------------------------------+--------------------------------------+
| Reference Content                    |     ---                              |
|                                      |     values:                          |
|                                      |     - &ref Something to reuse        |
|                                      |     - *ref  # Reused content         |
+--------------------------------------+--------------------------------------+
| Merging Keys                         |     default_settings:                |
|                                      |       install:                       |
|                                      |         dir: /usr/local              |
|                                      |         owner: root                  |
|                                      |       config:                        |
|                                      |         enabled: false               |
|                                      |                                      |
|                                      |     # Derive settings for 'my_app' f |
|                                      | rom default and change install::owne |
|                                      | r                                    |
|                                      |     my_app_settings:                 |
|                                      |       <<: *default_settings          |
|                                      |       install:                       |
|                                      |         owner: my_user               |
+--------------------------------------+--------------------------------------+
| Complex Mapping                      |     ---                              |
|                                      |     ? - key                          |
|                                      |     :                                |
|                                      |       - value                        |
|                                      |     # Note: key and value can be mul |
|                                      | tiple, complex structures            |
+--------------------------------------+--------------------------------------+


