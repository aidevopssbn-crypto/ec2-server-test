# Terraform Configuration - 2025-11-09 20:55:19

## Original Prompt
Role: You are a terraform expert
Context: Expecting ONLY HCL CODE NOTHING ELSE
Requirement: Need your help to generate the terraform code
Output: Can you please generate terraform code performing below operations

Use the AWS region as "us-east-1"

Use the AMI ID as "ami-0c7217cdde317cfec"

Use the key name as "aidevops"

Ensure you are generating three separate Terraform files properly — main.tf, variables.tf, and output.tf, and name them correctly.

Create one VPC and one public subnet, and launch one EC2 instance inside the public subnet.

Follow the below naming standards strictly:

Security group name → aidevops-sg

EC2 instance name → aidevops-server1

VPC name → aidevops-vpc

Public subnet name → aidevops-vpc-pubsubnet

VPC CIDR → 10.100.0.0/16

Public subnet CIDR → 10.100.10.0/24

Install Jenkins on the EC2 instance during bootstrapping using the user_data section directly inside the Terraform code (do not reference an external script).
Ensure Jenkins runs on port 8070 and is accessible publicly.

The EC2 instance’s user_data must include commands to:

Install Java and Jenkins

Modify Jenkins default port from 8080 to 8070

Enable and start the Jenkins service

Ensure the security group allows inbound access on ports 22 (SSH) and 8070 (Jenkins), and outbound access to all ports.

Output should define and display the following:

EC2 public IP

EC2 public DNS

VPC ID

Subnet ID

NOTE:

Output must contain ONLY pure Terraform HCL code.

Do not include any explanations, markdown formatting, or code fences (```).

## Generated Files

### main.tf
- Generated based on the prompt requirements

### variables.tf
- Generated based on the prompt requirements

### output.tf
- Generated based on the prompt requirements

## Resources Created
- aws_vpc.aidevops_vpc
- aws_subnet.aidevops_vpc_pubsubnet
- aws_security_group.aidevops_sg
- aws_instance.aidevops_server1
