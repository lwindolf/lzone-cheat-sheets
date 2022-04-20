## List of Github CI integrations

- [TravisCI](travis-ci.org): build using VMs and Docker
- [GitMate](https://gitmate.io/home): notify contacts, detect duplication

## Actions

## Interaction/input fields on manually triggering workflow

    name: someworkflow
    on:
      workflow_dispatch:
        inputs:
          branch:
            description: Please enter branch name
            default: main
          text:
            description: Describe your mood today
            required: true
            
    steps:
      - name: Use input
        run: BRANCH="${{ github.event.inputs.branch }}" ./run "${{ github.event.inputs.text }}" 
            
## Switching runners using output variables

    jobs:
      init:
        # Running an init step on a default runner to autosense the code
        outputs:
          mode: ${{ steps.autosense.outputs.runner }}    # Optional declaration
        steps:
          - name: checkout
            uses: actions/checkout@v2
            with:
              fetch-depth: 2

          - name: autosense
            id: autosense                 # Ensure to set an 'id' field here or it might silently fail!
            run: sh autosense.sh          # Does something like: echo "::set-output name=runner::my-special-runner-label"

      build:
        needs: [init]                     # Mandatory dependency to ensure outputs are set
        runs-on: ${{ needs.init.outputs.runner }}
        run: ...

## Conditional steps 

Job and steps can be run conditionally by specifying `if:` clauses

       job1:
         steps:
           - id: step1
             if: ${{ github.ref == 'main')

Note for boolean inputs always check on string 'true'!

         if: ${{ github.event.inputs[deployflag] == 'true' }}
         
There are additional string function that can be used

         if: ${{ startsWith(github.event.inputs[param1], 'production-') == 'true' }}
         if: ${{ endsWith(github.event.inputs[param2], '_suffix') == 'false' }}
         if: ${{ contains(github.event.inputs[param3], 'debug') != 'true' }}

For ternary operator use `<condition> && <outputTrue> || <outputFalse>` syntax:

    ${{ startsWith(github.ref, 'feature') && 'this is a feature branch' || 'another branch' }}

## Different working directory 

For a single step:

    jobs:
        job1:
           steps:
              - name: step1
                run: pwd
                working-directory: /etc
                
For all 'run' steps global default:

    jobs:
      job1:
        defaults:
          run:
            working-directory: mysubdir
