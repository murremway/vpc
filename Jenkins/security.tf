resource "aws_security_group" "jenkins_sg" {
	name = "jenkins_sg"
	description = "EC2 SG"

	ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = ["10.0.0.0/8"]
	}

  	ingress {
		from_port = 8080
		to_port = 8080
		protocol = "tcp"
		cidr_blocks = ["10.0.0.0/8"]
	}

	#Allow all outbound
	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
tags = {
    Name = "jenkins_sg"
  }
}