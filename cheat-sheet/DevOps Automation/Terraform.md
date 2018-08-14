## CLI Commands

    terraform plan         # dry run
    terraform apply
    terraform show
    terraform destroy
    
    terraform validate     # validate .tf file
    
    terraform taint        # mark resource for recreation
    terraform untaint
    
    terraform state push   # e.g. force push state to S3 bucket
    
Change verbosity by setting environment variable TF_LOG

    export TF_LOG=INFO

## Recovering Lost State

One of the worst things that you happen is [loosing the terraform state](https://www.reddit.com/r/devops/comments/93cee5/if_you_lost_your_terraform_state_you_will_lose/). In such a case you can

    terraform import <address> <id>
    
to let terraform reconstruct the resource state. Finally perform a

    terraform state push

as import only imports into a local state file, even if you have an S3 bucket defined for keeping state!

To avoid this use S3 bucket with versioning enabled for keeping state.
