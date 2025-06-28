resource "aws_instance" "k3s_node" {
  count         = 2
  ami           = "ami-0b4fbd58a32e7ef15"
  instance_type = "t2.micro"
  subnet_id     = module.vpc.private_subnets[count.index]
  key_name      = aws_key_pair.deployer.key_name

  vpc_security_group_ids = [aws_security_group.allow_internal.id]

  tags = {
    Name = "k3s-node-${count.index + 1}"
  }
}
