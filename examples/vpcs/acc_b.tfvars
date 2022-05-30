vpc_name        = "vpc-b"
aws_region      = "ap-southeast-1"
instance_type   = "t2.micro"
key_name        = "acc_b"
cidr            = "192.168.0.0/16"
private_subnets = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
public_subnets  = ["192.168.101.0/24", "192.168.102.0/24", "192.168.103.0/24"]
azs             = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
