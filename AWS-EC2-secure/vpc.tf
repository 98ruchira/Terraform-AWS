resource "aws_vpc" "Ruchira-VPC" {
  cidr_block = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags       = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "Ruchira-Public-Subnet" {
  vpc_id     = aws_vpc.Ruchira-VPC.id
  cidr_block = var.public_subnet_cidr_block

  tags       = {
    Name = var.public_subnet_name
  }

}

resource "aws_route_table" "public_subnet_route_table" {
    vpc_id = aws_vpc.Ruchira-VPC.id
}


resource "aws_subnet" "Ruchira-Private-Subnet" {
  vpc_id     = aws_vpc.Ruchira-VPC.id
  cidr_block = var.private_subnet_cidr_block
  
  tags       = {
    Name = var.private_subnet_name
  }

}

resource "aws_route_table_association" "private_subnet_route_table_association" {
  subnet_id = aws_subnet.Ruchira-Private-Subnet.id
  route_table_id = aws_route_table.Ruchira_private_route_table.id
}

resource "aws_internet_gateway" "Ruchira-igw" {
  vpc_id = aws_vpc.Ruchira-VPC.id
  
  tags   = {
    Name = var.internet_gateway_name
  }
}

resource "aws_route_table" "Ruchira_Public_route_table" {
  vpc_id = aws_vpc.Ruchira-VPC.id
  
  tags   = {
    Name = "Ruchira_Public_route_table"
  }

    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Ruchira-igw.id
  }
}

resource "aws_route_table" "Ruchira_private_route_table" {
  vpc_id = aws_vpc.Ruchira-VPC.id
  tags   = {
    Name = "Ruchira_private_route_table"
  }
}

resource "aws_eip" "Ruchira-eip" {
  domain = "vpc"
  instance = aws_instance.Ruchira-EC2-Public.id
  tags   = {
    Name = "Ruchira-EIP"
  }
}

resource "aws_nat_gateway" "Ruchira-NGW" {
  allocation_id = aws_eip.Ruchira-eip.id
  subnet_id     = aws_subnet.Ruchira-Public-Subnet.id

  tags = {
    Name = "Ruchira-NAT-Gateway"
  }

  depends_on = [aws_internet_gateway.Ruchira-igw]
}
