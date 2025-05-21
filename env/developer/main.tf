module "vpc" {
  source              = "../../modules/vpc" # Caminho relativo para o módulo vpc
  cidr_block          = "10.0.0.0/16"       # Defina o bloco CIDR para a VPC
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
  availability_zone   = "us-west-1b"
  tags = {
    Name = "developer-vpc"
  }
}
