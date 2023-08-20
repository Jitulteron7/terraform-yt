# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
 
}

// resource provider structure
# resource "<provider>_<resource_type>" "name" {
#   config options...
#   key = "value"
#   key2 = "value"
# }


# resource "aws_instance" "my_server" {
# //ami: "Amazon Machine Image." 
#   ami           = "ami-053b0d53c279acc90"
#   instance_type = "t2.micro"
#   tags = {
#     Name = "UBUNTU INSTANCE"
#   }
# }

resource "aws_vpc" "main-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}


resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.main-vpc.id // referenceing above resource vpc 
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "subnet-main1"
  }
}