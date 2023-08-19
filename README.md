# terraform-yt

## Commands 
- terraform init : terraform init sets up plugins, initializes backends, downloads external modules, manages authentication, and checks for updates in your Terraform project. It's the first step before using other Terraform commands like plan and apply.
- terraform plan: examines your Terraform configuration, compares it to the current state, and outlines the changes it will make to your infrastructure when applied. This command helps you understand the impact of your configuration changes without actually modifying your resources. It's a pre-deployment overview.
- terraform plan: apply configuration in your cloud



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
-
 





