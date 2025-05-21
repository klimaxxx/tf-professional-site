resource "aws_vpc" "professional_site" {
  cidr_block = var.cidr_block

  tags = merge(
    var.tags,
    {
      Name = "professional_site"
    }
  )
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.professional_site.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = merge(
    var.tags,
    {
      Name = "professional_site-alb-public"
    }
  )
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.professional_site.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.availability_zone
  tags = merge(
    var.tags,
    {
      Name = "professional_site-ecs-private"
    }
  )
}