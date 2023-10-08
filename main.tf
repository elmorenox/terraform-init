# configure aws provider
provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "us-east-1"
  #profile = "Admin"
}


resource "aws_instance" "subnet_b_ec2" {
  ami                     = "ami-053b0d53c279acc90"
  instance_type           = "t2.micro"
  subnet_id               = "subnet-0fb3244280a9b685d"
  key_name                = "LuisMoreno873key"

  vpc_security_group_ids = ["sg-0861654818083ed21"]

  associate_public_ip_address = true

  user_data = file("deploy-jenkins.sh")

  tags = {
    Name = "tf-created-ec2"
  }
}


output "instance_ip" {
  value = aws_instance.subnet_b_ec2.public_ip
}
