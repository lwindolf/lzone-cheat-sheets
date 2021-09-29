## List of Github CI integrations

- [TravisCI](travis-ci.org): build using VMs and Docker
- [GitMate](https://gitmate.io/home): notify contacts, detect duplication

## Actions

Interaction/input fields on manually triggering workflow

    name: someworkflow
    on:
      workflow_dispatch:
        inputs:
          my_branch:
            description: Please enter branch name
            required: true
            default: master
