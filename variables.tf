variable "region" {
  type = string
  default = "us-east-1"
}

variable "vpc_name" {
  type = string
  default = "aidevops-vpc"
}

variable "vpc_cidr" {
  type = string
  default = "10.100.0.0/16"
}

variable "public_subnet_name" {
  type = string
  default = "aidevops-vpc-pubsubnet"
}

variable "public_subnet_cidr" {
  type = string
  default = "10.100.10.0/24"
}

variable "security_group_name" {
  type = string
  default = "aidevops-sg"
}

variable "ami_id" {
  type = string
  default = "ami-0c7217cdde317cfec"
}

variable "key_name" {
  type = string
  default = "aidevops"
}

variable "ec2_instance_name" {
  type = string
  default = "aidevops-server1"
}