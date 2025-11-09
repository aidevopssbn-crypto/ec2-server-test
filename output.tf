output "ec2_public_ip" {
  value = aws_instance.aidevops_server1.public_ip
}

output "ec2_public_dns" {
  value = aws_instance.aidevops_server1.public_dns
}

output "vpc_id" {
  value = aws_vpc.aidevops_vpc.id
}

output "subnet_id" {
  value = aws_subnet.aidevops_vpc_pubsubnet.id
}