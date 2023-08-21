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

esource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main-vpc.id

  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "proud-route-table" {
  vpc_id = aws_vpc.main-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.proud-route-table.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_internet_gateway.proud-route-table.id
  }

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