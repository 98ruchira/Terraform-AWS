# Terraform AWS secure EC2 Setup

## Overview

This Terraform script sets up an AWS Virtual Private Cloud (VPC) with a public subnet, private subnet, and EC2 instances in both subnets. The VPC architecture includes an internet gateway to allow internet access to instances in the public subnet.

## Prerequisites

## Before running the Terraform script, ensure you have the following:

- AWS CLI configured with appropriate credentials.
- Terraform installed on your machine.

## Configuration

## Update the values in the `terraform.tfvars` file according to your requirements:

``hcl
region                   = "us-east-1" ## Example
vpc_cidr_block           = "10.0.0.0/16" ## Example
public_subnet_cidr_block  = "10.0.1.0/24" ## Example
private_subnet_cidr_block = "10.0.2.0/24" ## Example
ami_id                   = "ami-0230bd60aa48260c6" ## Example
instance_type            = "t2.micro" ## Example
key_pair_name            = "test-Ruchira-key" ## Example
ssh_ingress_cidr_blocks  = ["0.0.0.0/0"] ## Example
vpc_name                 = "Ruchira-VPC" ## Example
public_subnet_name       = "Ruchira-Public-Subnet" ## Example
private_subnet_name      = "Ruchira-Private-Subnet" ## Example
internet_gateway_name    = "Ruchira-igw" ## Example
ec2_public_instance_name = "Ruchira-EC2-Public" ## Example
ec2_private_instance_name = "Ruchira-EC2-Private" ## Example


## Run the following command to initialize Terraform and download the necessary providers:

terraform init

## Generate the execution plan:

terraform plan

## Ensure that the execution plan looks correct before proceeding.
## Apply the changes:

terraform apply
Confirm the changes when prompted.

## Notes
The security group associated with instances allows incoming SSH traffic on port 22 only.
The public subnet is connected to the internet, while the private subnet is connected to the public subnet through a route table.
