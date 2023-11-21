resource "aws_vpc" "Ruchira-VPC" {
  cidr_block = var.vpc_cidr_block
  tags       = var.vpc_tags
}

resource "aws_subnet" "Ruchira-Public-Subnet" {
  vpc_id     = aws_vpc.Ruchira-VPC.id
  cidr_block = var.public_subnet_cidr_block
  tags       = var.public_subnet_tags
}

resource "aws_subnet" "Ruchira-Private-Subnet" {
  vpc_id     = aws_vpc.Ruchira-VPC.id
  cidr_block = var.private_subnet_cidr_block
  tags       = var.private_subnet_tags
}

resource "aws_internet_gateway" "Ruchira-igw" {
  vpc_id = aws_vpc.Ruchira-VPC.id
  tags   = var.igw_tags
}

resource "aws_route_table" "Public-RT" {
  vpc_id = aws_vpc.Ruchira-VPC.id
  tags   = var.public_rt_tags

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Ruchira-igw.id
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.Ruchira-VPC.id
  tags   = var.private_rt_tags
}

resource "aws_eip" "Ruchira-eip" {
  domain = "vpc"
  tags   = var.eip_tags
}

resource "aws_nat_gateway" "Ruchira-NGW" {
  allocation_id = aws_eip.Ruchira-eip.id
  subnet_id     = aws_subnet.Ruchira-Public-Subnet.id

  tags = var.nat_gateway_tags

  depends_on = [aws_internet_gateway.Ruchira-igw]
}