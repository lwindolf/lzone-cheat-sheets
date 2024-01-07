{% raw %}

## Environment variables

- `GITHUB_REF`
- `GITHUB_BASE_REF`
- `GITHUB_HEAD_REF`
- `GITHUB_ENV` (writable environment file passed between jobs)
- `GITHUB_WORKSPACE`
- `GITHUB_REPOSITORY`
- `GITHUB_REPOSITORY_OWNER` (user or organisation name)
- `GITHUB_RUN_NUMBER` (pipeline unique)
- `GITHUB_RUN_ID` (globally unique)

[Documentation](https://docs.github.com/en/actions/learn-github-actions/environment-variables#default-environment-variables)

## Workflow commands (annotations)

    echo '::set-output name={name}::{value}'
    
    echo "::add-mask::MySecretPassword"

    echo '::notice::My message'
    echo '::error::My error'
    echo '::error file={name},line={line},endLine={endLine},title={title}::{message}'
    
    echo '::group::My group title'
    echo '::endgroup::'
    
    echo '::save-state name={name}::{value}'     # Export env vars to pre/post workflow actions

[Doucmentation](https://docs.github.com/en/actions/using-workflows/workflow-commands-for-github-actions)

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
          mode: ${{ steps.autosense.outputs.runner }}    # Mandatory declaration
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

Note for boolean inputs always check on string `'true'`!

     if: ${{ github.event.inputs[deployflag] == 'true' }}
         
There are additional [string functions](https://docs.github.com/en/actions/learn-github-actions/expressions) that can be used

     if: ${{ startsWith(matrix.stage, 'production-') == true }}
     if: ${{ endsWith(name, '_suffix') == false }}
     if: ${{ contains(mode, 'debug') != true }}

For ternary operator use `<condition> && <outputTrue> || <outputFalse>` syntax:

    ${{ startsWith(github.ref, 'feature') && 'this is a feature branch' || 'another branch' }}
    
To always run a step even if a previous step did fail

    if: always()


## Dynamic and customizable matrix job

Due to missing global variable support it is actually challenge to properly default
a customizable matrix (i.e. when you allow it to be changed by workflow_dispatch input).
Note that this is extra-complicated as you cannot access the default value of workflow
dispatch events when you are in another event type. So the default matrix value has to 
be stored somewhere else and to be merged with any possible input. The only available
global place for up to GHE 3.4 is a global env variable string.

    name: testsuite
    
    on:
      # The entire testsuite runs at night
      schedule:
      - cron: '0 2 * * *'
      
      workflow_dispatch:
        inputs:
          # Note: as we have a large nr of tests we want our users to be able
          # to only run some of them using this input
          testcases:
            description: Test cases to run (empty for all)
            type: string
            default: ""

    env:
      testcases: tc1,tc2,tc3
            
    jobs:
      # matrix preparation with extra step and fromJson() input as described by
      # https://stackoverflow.com/questions/65384420/how-to-make-a-github-action-matrix-element-conditional
      prepare:
        runs-on: self-hosts
        outputs:
          matrix: ${{ steps.set-matrix.outputs.matrix }}
        steps:
          - uses: actions/checkout@v2
          - id: set-matrix
            run: |
              list="${{ github.event.inputs.testcases }}"
              list="${list:-${{ env.testcases }}}"
              echo '::set-output name=matrix::'"$(echo "$list" | jq -s --raw-input 'split("\n")[0] | split(",")' | tr "\n" " ")"

      testcase:  
        needs: prepare
        strategy:
          fail-fast: false
          matrix:
            name: ${{ fromJson(needs.prepare.outputs.matrix ) }}

        runs-on: self-hosted
        steps:
          [...]


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

## Inspecting all workflow_dispatch inputs

Use `${{ github.event.inputs }}` which will expand into a valid JSON map of all inputs and their values.

## Job reports

To create a per job report from Markdown input.

    cat <<EOT >>${GITHUB_STEP_SUMMARY}
    
    ## Report 
    
    - info 1 [some link](https://example.com)
    - info 2
    
    EOT
    
You can also run it in each step to accumulate a report.

## Manage Runners

### Which jobs are run how often?

Print a pipeline histogram for the specific runner:

    grep "value.:[[:space:]]*..github/workflows" /opt/app-root/src/_diag/Worker_*.log |\
    sed 's/.*workflows.//;s/"//' | sort | uniq -c | sort -nr
    
### Delete runners not alive anymore

This is useful with dynamically registered runners, that are not guaranteed to unregister (i.e. k8s pods)

- List runners via `/orgs/<org name>/actions/runners`
- Foreach runner with `status` == `offline`
  - Perform HTTP `DELETE` on `/orgs/<org name>/actions/runner/<runner id>`

### Use non Github images

To use public/private images from an external registry define `container

    jobs:
      test:
        runs-on: ubuntu-latest
        container: ubuntu:23.03
        
        # credentials are optional
        credentials:
          username: myuser
          password: ${{ secrets.mysecret }}

## Run GH Actions locally

[https://github.com/nektos/act](https://github.com/nektos/act)

{% endraw %}
