provider "aws" {
  region = "ap-northeast-2"
}

module "vpc" {
  source = "../../modules/vpc"
  name   = "parksm-test"
  ipv4_cidrs = [
    {
      cidr = "10.70.0.0/16"
    }
  ]
  internet_gateway = {
    enabled = true
  }
}

module "security_group" {
  source = "../../modules/security-group"

  vpc_id = module.vpc.id

  name = "parksm-test-sg"

  revoke_rules_on_delete = true

  ingress_rules = [
    {
      id          = "tcp/80"
      description = "Allow HTTP from VPC"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      ipv4_cidrs  = ["192.168.0.0/16", "10.0.0.0/8", "172.168.0.0/24"]
    },
  ]
  egress_rules = [
    {
      id          = "all/all"
      description = "Allow all traffics to the internet"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      ipv4_cidrs  = ["0.0.0.0/0"]
    },
  ]
}
