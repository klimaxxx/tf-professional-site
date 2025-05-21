module "vpc" {
  source = "./modules/vpc"

  cidr_block          = var.vpc_cidr
  public_subnet_cidr  = var.public_subnets[0]
  private_subnet_cidr = var.private_subnets[0]
  availability_zone   = var.availability_zones[0]

  tags = {
    Environment = var.environment
    Terraform   = "true"
    Project     = var.project_name
  }
} 