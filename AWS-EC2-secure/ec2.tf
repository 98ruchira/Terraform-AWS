resource "aws_key_pair" "test-pc-key" {
  key_name   = var.key_pair_name
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_security_group" "RuchiraSG" {
  name        = "RuchiraSG"
  description = "Allow inbound SSH and HTTP traffic"
  vpc_id      = aws_vpc.Ruchira-VPC.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_ingress_cidr_blocks
  }
}

resource "aws_instance" "Ruchira-EC2-Public" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_pair_name
  associate_public_ip_address = true
  subnet_id              = aws_subnet.Ruchira-Public-Subnet.id
  vpc_security_group_ids = [aws_security_group.RuchiraSG.id]
  

  tags = {
    Name = var.ec2_public_instance_name
  }
}


resource "aws_instance" "Ruchira-EC2-Private" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_pair_name  
  subnet_id              = aws_subnet.Ruchira-Private-Subnet.id
  vpc_security_group_ids = [aws_security_group.RuchiraSG.id]

  tags = {
    Name = var.ec2_private_instance_name
  }
}


