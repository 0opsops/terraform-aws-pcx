vpc_name        = "vpc-a"
aws_region      = "us-east-1"
instance_type   = "t2.micro"
key_name        = "acc_a"
cidr            = "172.32.0.0/16"
private_subnets = ["172.32.1.0/24", "172.32.2.0/24", "172.32.3.0/24"]
public_subnets  = ["172.32.101.0/24", "172.32.102.0/24", "172.32.103.0/24"]
azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
