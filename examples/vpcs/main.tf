module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"
  name    = var.vpc_name
  cidr    = var.cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform   = "true"
    Environment = "labs"
  }
}

# # Get AMI
data "aws_ami" "ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Create EIP
resource "aws_eip" "this" {
  instance = aws_instance.this.id
  vpc      = true
  depends_on = [
    module.vpc.igw_id
  ]
}

# Attach EIP
resource "aws_eip_association" "this" {
  instance_id   = aws_instance.this.id
  allocation_id = aws_eip.this.id
}

# Create EC2
resource "aws_instance" "this" {
  ami                    = data.aws_ami.ami.id
  key_name               = var.key_name
  instance_type          = var.instance_type
  subnet_id              = element(module.vpc.public_subnets, 0)
  vpc_security_group_ids = ["${aws_security_group.access_this.id}"]

  root_block_device {
    volume_type           = "gp3"
    volume_size           = 50
    iops                  = 3000
    throughput            = 125
    delete_on_termination = true
    tags = {
      Name = "this-ec2"
    }
  }

  tags = {
    Name = "this-ec2"
  }
}

# Create SG
resource "aws_security_group" "access_this" {
  name   = "access_this_vm"
  vpc_id = module.vpc.vpc_id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "access_this_vm"
  }
}