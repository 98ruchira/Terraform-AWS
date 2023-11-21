resource "aws_security_group" "RuchiraSG" {
  name        = "RuchiraSG"
  description = "Allow inbound SSH and HTTP traffic"
  vpc_id      = aws_vpc.Ruchira-VPC.id
  tags        = var.security_group_tags

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_cidr_blocks
  }
}

resource "aws_instance" "Ruchira-EC2-Public" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.Ruchira-Public-Subnet.id
  vpc_security_group_ids = [aws_security_group.RuchiraSG.id]

  tags = var.public_instance_tags
}

resource "aws_instance" "Ruchira-EC2-Private" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.Ruchira-Private-Subnet.id
  vpc_security_group_ids = [aws_security_group.RuchiraSG.id]

  tags = var.private_instance_tags
}


