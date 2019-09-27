
See also <?add topic='AWS Lambda'?> <?add topic='S3'?>

## Drawing AWS Architectures

Use the AWS library for draw.io: https://www.draw.io/?splash=0&libs=aws3

## Configuring Profiles

    aws configure set help

    aws configure set aws_access_key_id <key id>
    aws configure set aws_secret_access_key <secret>
    aws configure set default.region <region>
    aws configure set region <region>

To query/configure specific profiles prefix the profile to the config key

    aws configure get <profile>.region
    aws configure set <profile>.region <region>

## EC2 CLI Commands

Instance types overview https://aws.amazon.com/ec2/instance-types/

    aws ec2 describe-instances                           # List all
    aws ec2 reboot-instances --instance-ids <ids>

## IAM

    aws iam list-roles
    aws iam list-roles | jq -r '.Roles[].RoleName'       # Print role names
    aws iam list-roles | jq -r '.Roles[].Arn'            # Print ARNs
    
    aws iam get-role --role-name <name>
    aws iam create-role --role-name <name> --asume-role-policy-document '<text>'
    aws iam delete-role --role-name                      # Note: you need to detach all policies first!
    
 To list policies you need 2 commands, as there are 2 types of policies: attached policies and inline policies
    
    # For attached policies
    aws iam list-attached-role-policies --role-name <name>
    
    # For inline policies
    aws iam list-role-policies --role-name <name>

To add/remove an inline policy

    aws iam put-role-policy --role-name <role name> --policy-name <policy name> --policy-document '<text>'
    aws iam delete-role-policy --role-name <role name> --policy-name <policy name>

To attach/detach an existing policy

    aws iam attach-role-policy --role-name <role name> --policy-arn <policy arn>
    aws iam detach-role-policy -q-role-name <role name> --policy-arn <policy arn>
    
### IAM Roles in ~/.aws/credentials

From other credential

    [marketingadmin]
    role_arn = arn:aws:iam::123456789012:role/marketingadminrole
    source_profile = user1

From within EC2 instance

    [profile marketingadmin]
    role_arn = arn:aws:iam::123456789012:role/marketingadminrole
    credential_source = Ec2InstanceMetadata

## STS

    aws sts get-caller-identity | jq -r '.Account'                      # Resolve your account id
    aws sts assume-role --role-arn <arn> --role-session-name <any name>

## EBS

- [Calculate EBS pricing](https://www.reddit.com/r/aws/comments/90j5zy/programmaticaly_get_price_of_ebs_volumes/)
- [Find unattached EBS volumes](https://www.reddit.com/r/devops/comments/9156d4/find_unattached_aws_ebs_volumes/)

## ELB

- [Configuring HTTPS redirects](https://aws.amazon.com/about-aws/whats-new/2018/07/elastic-load-balancing-announces-support-for-redirects-and-fixed-responses-for-application-load-balancer/)

## CloudFormation

- Nesting Templates with [AWS::Include](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/create-reusable-transform-function-snippets-and-add-to-your-template-with-aws-include-transform.html)

      Transform:
        Name: 'AWS::Include'
        Parameters:
        Location: 's3://MyAmazonS3BucketName/MyFileName.yaml'

- CLI Stack Handling

      # Check if stack exists
      if aws cloudformation describe-stacks --stack-name "$STACK_NAME" >/dev/null 2>/dev/null; then
         echo "$STACK_NAME exists!"
      fi
      
      # Delete stack and wait for completion
      aws cloudformation delete-stack --stack-name "$STACK_NAME"
      aws cloudformation wait stack-delete-complete --stack-name "$STACK_NAME"
      
      # Create stack and wait for completion
      aws cloudformation create-stack \
         --region "$AWS_REGION" \
         --stack-name "$STACK_NAME" \
         --template-body "file://mytemplate.yaml" \
         --parameters <parameters>
         ...
      aws cloudformation wait stack-create-complete --stack-name "$STACK_NAME"

- Automation with Ansible
   - [How-To Create Stacks](http://darrylcauldwell.com/aws-cloudformation/)
   - [Define Stacks in YAML using Jinja](https://gist.github.com/jheller/c4fa0075e4eccf094769)
   
