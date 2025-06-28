resource "aws_instance" "bastion" {
  ami                         = "ami-0b4fbd58a32e7ef15"
  instance_type               = "t2.micro"
  subnet_id                   = module.vpc.public_subnets[0]
  key_name                    = aws_key_pair.deployer.key_name
  associate_public_ip_address = true

  tags = {
    Name = "bastion"
  }

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
}
