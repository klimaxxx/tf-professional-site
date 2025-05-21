# SG para o ALB - público
resource "aws_security_group" "alb_sg" {
  name        = "alb-sg"
  description = "Permitir acesso HTTP publico ao ALB"
  vpc_id      = aws_vpc.professional_site.id

  tags = {
    Name = "alb-sg"
  }
}

# Regra de entrada no ALB - permite acesso HTTP de qualquer lugar
resource "aws_vpc_security_group_ingress_rule" "alb_http_ingress" {
  security_group_id = aws_security_group.alb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  description       = "Permitir trafego HTTP publico"
}

# Regra de saída do ALB - permite tudo (ajuste se quiser mais restrição)
resource "aws_vpc_security_group_egress_rule" "alb_egress_all" {
  security_group_id = aws_security_group.alb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# SG para ECS - privado
resource "aws_security_group" "ecs_sg" {
  name        = "ecs-sg"
  description = "Permitir acesso ao ECS apenas via ALB"
  vpc_id      = aws_vpc.professional_site.id

  tags = {
    Name = "ecs-sg"
  }
}

# Regra de entrada no ECS - permite apenas do ALB SG
resource "aws_vpc_security_group_ingress_rule" "ecs_from_alb" {
  security_group_id            = aws_security_group.ecs_sg.id
  referenced_security_group_id = aws_security_group.alb_sg.id
  from_port                    = 8080
  to_port                      = 8080
  ip_protocol                  = "tcp"
  description                  = "Permitir trafego do ALB"
}

# Regra de saída do ECS - tudo liberado
resource "aws_vpc_security_group_egress_rule" "ecs_egress_all" {
  security_group_id = aws_security_group.ecs_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
