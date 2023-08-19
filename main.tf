# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  access_key = "AKIAQ3NCJ36OCMMJEOOC"
  secret_key = "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"
}

// resource provider structure
# resource "<provider>_<resource_type>" "name" {
#   config options...
#   key = "value"
#   key2 = "value"
# }
resource "aws_instance" "my_server" {
//ami: "Amazon Machine Image." 
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"
  tags = {
    Name = "HelloWorld"
  }
}