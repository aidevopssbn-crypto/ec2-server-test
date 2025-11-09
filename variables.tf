variable "aws_region" {
  type = string
  default = "us-east-1"
}

variable "ami_id" {
  type = string
  default = "ami-0c7217cdde317cfec"
}

variable "key_name" {
  type = string
  default = "aidevops"
}

variable "vpc_cidr" {
  type = string
  default = "10.100.0.0/16"
}

variable "public_subnet_cidr" {
  type = string
  default = "10.100.10.0/24"
}