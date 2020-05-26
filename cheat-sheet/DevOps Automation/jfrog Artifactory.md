## CLI Usage

    jfrog rt c         # Configure jfrog endpoint and authentication

## API Queries

[jfrog API docs](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API)

    jfrog rt cl <API path>                    # Run curl commands using stored credentials
    
    jfrog rt cl /api/build                    # List builds
    jfrog rt cl /api/build/<name>             # Get build runs
    jfrog rt cl /api/build/<name>/<id>        # Get build run info
    
    jfrog rt cl /api/storage/<path>           # File listing
    jfrog rt cl /api/compliance/<path>        # Compliance details

## API Search Queries

Quick Search

    # Any artifact in a folder
    jfrog rt cl /api/search/artifact?name=<file name>&repos=<repo name>
    
    # Maven artifact
    jfrog rt cl /api/search/gavc?g=<group>&a=<artifact>&v=<version>&c=<classifier>&repos=<repo>

    # Pattern search
    jfrog rt cl /api/search/pattern?pattern=<repo>:<ant pattern>
    jfrog rt cl /api/search/pattern?pattern=libs-release-local:killer/*/ninja/*/*.jar

    # Reverse dependency lookup
    jfrog rt cl /api/search/dependency?sha1=<checksum>
    
    # Get list of repos
    jfrog rt cl /api/repositories

## jfrog AQL Examples

Alternatively to quick search you can perform complex queries using [AQL](https://www.jfrog.com/confluence/display/JFROG/Artifactory+REST+API#ArtifactoryRESTAPI-ArtifactoryQueryLanguage(AQL))

    // Find packages by name matching
    items.find({"name":{"$match":"mypackage-*"}})
    
    // Find packages by type
    items.find({"type":{"$eq":"conan"}})
    
    // Find repo by name
    items.find({"repo":{"$eq":"libs-release-local"}})

    // Return all artifacts of the "artifactory" build.
    items.find({"@build.name":{"$eq":"artifactory"}})

    // Return all builds that have a dependency with a license that is not Apache.
    builds.find({"module.dependency.item.@license":{"$nmatch":"Apache-*"}})

    // Return all archives containing a file called "org/artifactory/Main.class".
    items.find({"archive.entry.name":{"$eq":"Main.class"} , "archive.entry.path":{"$eq":"org/artifactory"}})
