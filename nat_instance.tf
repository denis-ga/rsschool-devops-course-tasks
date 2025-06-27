resource "aws_instance" "nat" {
  ami                         = "ami-0b4fbd58a32e7ef15"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public[0].id
  associate_public_ip_address = true
  source_dest_check           = false

  tags = { Name = "nat-instance" }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y iptables-services
              sysctl -w net.ipv4.ip_forward=1
              iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
              EOF
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  
  route {
    cidr_block  = "0.0.0.0/0"
    nat_gateway_id  = aws_instance.nat.id
  }
  
  tags = { Name = "private-rt" }
}

resource "aws_route_table_association" "private_assoc" {
  count          = 2
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}