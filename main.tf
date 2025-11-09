provider "aws" {
  region = var.region
}

resource "aws_vpc" "aidevops_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "aidevops_vpc_pubsubnet" {
  vpc_id            = aws_vpc.aidevops_vpc.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = "us-east-1a"
  tags = {
    Name = var.public_subnet_name
  }
}

resource "aws_security_group" "aidevops_sg" {
  name        = var.security_group_name
  description = "Allow inbound traffic on ports 22 and 8070"
  vpc_id      = aws_vpc.aidevops_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8070
    to_port     = 8070
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group_name
  }
}

resource "aws_instance" "aidevops_server1" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.aidevops_sg.id]
  subnet_id = aws_subnet.aidevops_vpc_pubsubnet.id
  key_name               = var.key_name
  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install default-jdk -y
              wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
              sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
              sudo apt update -y
              sudo apt install jenkins -y
              sudo sed -i 's/HTTP_PORT=8080/HTTP_PORT=8070/' /etc/jenkins/jenkins.conf
              sudo service jenkins restart
              sudo update-rc.d jenkins defaults
              EOF
  tags = {
    Name = var.ec2_instance_name
  }
}