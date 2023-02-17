provider "aws" {
  region = var.AWS_REGION
}

# terraform {
#   backend "s3" {
#     bucket = "BUCKET-NAME"
#     key    = "NAME YOU WANT"
#     region = var.AWS_REGION
#   }
# }


#this ami is for us-east-1 for ubuntu 18 pls change your own to your region
resource "aws_instance" "jenkins" {
  ami                    = "ami-08fdec01f5df9998f"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  subnet_id              = var.subnet_id
  key_name               = "keyname"
  user_data              = file("jenkins.sh")

  tags = {
    Name = "Jenkins"
  }
}