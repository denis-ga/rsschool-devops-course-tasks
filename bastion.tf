# Bastion хост в публичной подсети
resource "aws_instance" "bastion" {
  ami                         = "ami-0b4fbd58a32e7ef15"
  instance_type               = var.bastion_instance_type
  subnet_id                   = aws_subnet.public[0].id
  associate_public_ip_address = true
  key_name                    = "${var.project_name}-keypair"

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y htop wget curl vim
    
    # Настройка SSH для проброса подключений
    echo "AllowAgentForwarding yes" >> /etc/ssh/sshd_config
    systemctl restart sshd
    
    # Установка kubectl для управления кластером
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
  EOF

  tags = {
    Name        = "${var.project_name}-bastion"
    Environment = var.environment
    Project     = var.project_name
    Type        = "Bastion"
  }
}