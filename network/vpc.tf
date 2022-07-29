##########################################
################# VPC ####################
##########################################



resource "google_compute_network" "vpc_network" {
  project = "abdelsalam-billing-account"
  name                    = var.vpc_name
  auto_create_subnetworks = false
}