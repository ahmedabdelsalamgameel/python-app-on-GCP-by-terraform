########################################
####### MANAGEMENT SUBNET ##############
########################################

resource "google_compute_subnetwork" "management_subnet" {
  name          = var.m_subnet_name
  ip_cidr_range = var.m_subnet_cidr
  private_ip_google_access = true
  region        = var.region
  network       = google_compute_network.vpc_network.id
}



########################################
####### RESTRICTED SUBNET ##############
########################################

resource "google_compute_subnetwork" "restricted_subnet" {
  name                     = var.r_subnet_name
  ip_cidr_range            = var.r_subnet_cidr
  private_ip_google_access = true
  region                   = var.region
  network                  = google_compute_network.vpc_network.id
}