## CLI Commands

    terraform plan         # dry run
    terraform apply
    terraform refresh      # sync state with remote resources
    terraform show
    terraform destroy
    
    terraform validate     # validate .tf file
    
    terraform taint        # mark resource for recreation
    terraform untaint
    
    terraform state push   # e.g. force push state to S3 bucket
    terraform state pull > terraform.tfstate  # create a local state copy
    
Change verbosity by setting environment variable TF_LOG

    export TF_LOG=INFO

## Recovering Lost State

One of the worst things that you happen is [loosing the terraform state](https://www.reddit.com/r/devops/comments/93cee5/if_you_lost_your_terraform_state_you_will_lose/). In such a case you can

    terraform import <address> <id>
    
    # for example
    terraform import aws_instance.myec2instance i-075c8d21cc91308dc

    
to let terraform reconstruct the resource state. Finally perform a

    terraform state push

as import only imports into a local state file, even if you have an S3 bucket defined for keeping state!

To avoid this use S3 bucket with versioning enabled for keeping state.

## Drift Management

Terraform [doesn't really do](https://www.hashicorp.com/blog/detecting-and-managing-drift-with-terraform)
much drift management. Only some resource attributes are checked.

Manually detect drift

    terraform show >before
    terraform refresh
    terraform show >after
   
    diff -u before after
 
Prevent auto-destroy:

     lifecycle {
        prevent_destroy = true
     }


## Bulk Imports

Check out https://github.com/jmcgill/formation
