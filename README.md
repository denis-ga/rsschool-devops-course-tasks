# Terraform AWS VPC Setup

## Содержимое:

- VPC с CIDR 10.0.0.0/16
- 2 публичные и 2 приватные подсети в разных AZ
- Internet Gateway
- NAT Gateway для приватных подсетей
- Bastion Host
- Security Groups

## Использование

```bash
terraform init
terraform plan
terraform apply
```
