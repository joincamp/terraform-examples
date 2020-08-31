module "vpc" {
  source                 = "terraform-aws-modules/vpc/aws"
  name                   = "${var.prefix}-${var.environment}"
  cidr                   = var.vpc_cidr
  azs                    = slice(data.aws_availability_zones.this.names, 0, 2)
  private_subnets        = var.public_subnet_cidrs
  public_subnets         = var.private_subnet_cidrs
  enable_nat_gateway     = false
  single_nat_gateway     = false
  one_nat_gateway_per_az = false
  tags                   = var.tags
  version                = "~>2.0"
  enable_dns_hostnames   = true
}
