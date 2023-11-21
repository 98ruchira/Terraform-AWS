variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr_block" {
  default = "10.0.2.0/24"
}

variable "instance_ami" {
  default = "ami-0230bd60aa48260c6"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "test-pc-key"
}

variable "ssh_cidr_blocks" {
  default = ["0.0.0.0/0"]
}

variable "vpc_tags" {
  default = {
    Name = "Ruchira-VPC"
  }
}

variable "public_subnet_tags" {
  default = {
    Name = "Ruchira-Public-Subnet"
  }
}

variable "private_subnet_tags" {
  default = {
    Name = "Ruchira-Private-Subnet"
  }
}

variable "igw_tags" {
  default = {
    Name = "Ruchira-igw"
  }
}

variable "public_rt_tags" {
  default = {
    Name = "Ruchira-Public-Route-Table"
  }
}

variable "private_rt_tags" {
  default = {
    Name = "Ruchira-Private-Route-Table"
  }
}

variable "security_group_tags" {
  default = {
    Name = "RuchiraSG"
  }
}

variable "public_instance_tags" {
  default = {
    Name = "Ruchira-EC2-Public"
  }
}

variable "private_instance_tags" {
  default = {
    Name = "Ruchira-EC2-Private"
  }
}

variable "eip_tags" {
  default = {
    Name = "Ruchira-EIP"
  }
}

variable "nat_gateway_tags" {
  default = {
    Name = "Ruchira-NAT-Gateway"
  }
}
