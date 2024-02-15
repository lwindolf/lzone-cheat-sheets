## Split YAML containing multiple documents

You can split a file into multiple files using `-s` and providing a value lookup to use for the filenames:

     yq -s '.metadata.name' k8s-resources.yml
