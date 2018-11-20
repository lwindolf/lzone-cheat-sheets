
## Schema Queries

If you do not know a remote schema query all existing types like this

    query {
      __schema {
        types {
          name
        }
      }
    }

For a given type query all attributes like this

    query {
      __type(name: "Author") {
        name
        description
      }
    }

## Tools

- [GraphQL IDE](https://github.com/prisma/graphql-playground)
