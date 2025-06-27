output "vpc_id" {
  description = "ID VPC"
  value       = aws_vpc.main.id
}

output "vpc_cidr_block" {
  description = "CIDR блок VPC"
  value       = aws_vpc.main.cidr_block
}

output "internet_gateway_id" {
  description = "ID Internet Gateway"
  value       = aws_internet_gateway.igw.id
}

output "public_subnet_ids" {
  description = "ID публичных подсетей"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "ID приватных подсетей"
  value       = aws_subnet.private[*].id
}

output "public_subnet_cidrs" {
  description = "CIDR блоки публичных подсетей"
  value       = aws_subnet.public[*].cidr_block
}

output "private_subnet_cidrs" {
  description = "CIDR блоки приватных подсетей"
  value       = aws_subnet.private[*].cidr_block
}

output "bastion_public_ip" {
  description = "Публичный IP bastion хоста"
  value       = aws_instance.bastion.public_ip
}

output "bastion_private_ip" {
  description = "Приватный IP bastion хоста"
  value       = aws_instance.bastion.private_ip
}

output "security_group_bastion_id" {
  description = "ID Security Group для bastion хоста"
  value       = aws_security_group.bastion.id
}

output "ssh_command_bastion" {
  description = "Команда для подключения к bastion хосту"
  value       = "ssh -i ~/.ssh/id_rsa ec2-user@${aws_instance.bastion.public_ip}"
}