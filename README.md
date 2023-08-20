# terraform-yt

## Commands 
- terraform init : terraform init sets up plugins, initializes backends, downloads external modules, manages authentication, and checks for updates in your Terraform project. It's the first step before using other Terraform commands like plan and apply.
- terraform plan: examines your Terraform configuration, compares it to the current state, and outlines the changes it will make to your infrastructure when applied. This command helps you understand the impact of your configuration changes without actually modifying your resources. It's a pre-deployment overview.
- terraform apply: apply configuration in your cloud
- terraform apply --auto-approve: default approve apply without "yes"
- terraform destory: destroy all the resources



## Note
- AMI : stands for "Amazon Machine Image" The ami parameter specifies which Amazon Machine Image you want to use as the basis for your instance. 
    ```tf
        resource "aws_instance" "my_server" {
        ami           = data.aws_ami.ubuntu.id  # AMI to use for the instance
        instance_type = "t3.micro"              # Instance type (size)

        tags = {
            Name = "HelloWorld"  # Tags to assign to the instance for identification
        }
        }
    ```
    In this snippet, you are creating an EC2 instance named "my_server" using the specified Ubuntu AMI. The instance_type parameter defines the size of the instance (in this case, a t3.micro instance). The tags block is used to assign metadata to the instance, in this case giving it the tag "Name" with the value "HelloWorld."
-  If you comment or remove a resource from the terraform file then it will destory the resource since it is not present in the file.  

 - what is resource and data source in aws ?
   ans: 
    In the context of Terraform, a popular infrastructure as code tool used to manage cloud resources, "resource" and "data source" are two fundamental concepts used to define and interact with AWS (Amazon Web Services) components.

    Resource:
    In Terraform, a "resource" represents a specific infrastructure object that you want to create, modify, or manage. It corresponds to a real-world entity in your cloud environment, such as an Amazon EC2 instance, an S3 bucket, a security group, etc. Resources are defined using the resource block in your Terraform configuration.

    For example, the following code defines an AWS EC2 instance as a resource:

    ```
        resource "aws_instance" "example" {
            ami           = "ami-0123456789abcdef0"
            instance_type = "t2.micro"
        }

    ```
    In this case, aws_instance is the resource type, and example is the resource name. The resource attributes (ami and instance_type) specify the desired properties of the EC2 instance.

    Data Source:
    A "data source" in Terraform is used to retrieve information from an external source, such as an existing resource in AWS, without creating a new resource. Data sources allow you to incorporate existing information into your Terraform configuration. Data sources are defined using the data block.

    For instance, to retrieve information about an existing Amazon Machine Image (AMI) for use in your Terraform configuration, you might use a data source like this:

    ```
        data "aws_ami" "example" {
            most_recent = true
            owners      = ["self"]
        }
    ```

    Here, aws_ami is the data source type, and example is the data source name. The data source attributes (most_recent and owners) specify the criteria for retrieving the desired AMI.

    In summary, in Terraform's AWS context:

    A "resource" represents something you want to create or manage in AWS.
    A "data source" retrieves information from existing resources in AWS, allowing you to incorporate external data into your Terraform configuration.

- For most of the cases  resource which depends on one another order of code lines does not matter. terraform is smart to detect which resource depends on which resource. However there might be some cases where you need to define the referece, So keep that in mind   

- .terraform file contains all the plugins installed 
- terraform.tfstate contains info of the terraform states. Basically tracks the changes




