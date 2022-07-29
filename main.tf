
module "network" {
    source = "./network"
    region = var.region
    vpc_name = var.vpc_name
   
    m_subnet_name = var.manage_subnet_name
    m_subnet_cidr = var.manage_subnet_cidr
    r_subnet_name = var.rest_subnet_name
    r_subnet_cidr = var.rest_subnet_cidr
}