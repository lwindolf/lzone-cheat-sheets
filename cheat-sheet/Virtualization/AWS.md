See also <?add topic='AWS Lambda'?> <?add topic='S3'?>

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
   
