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
