variable "cidr_block" {
  description = "Bloco CIDR para a VPC"
  type        = string
}

variable "tags" {
  description = "Tags para a VPC"
  type        = map(string)
  default     = {}
}

variable "public_subnet_cidr" {
  description = "CIDR block da subnet pública"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block da subnet privada"
  type        = string
}

variable "availability_zone" {
  description = "Zona de disponibilidade para a subnet"
  type        = string
}