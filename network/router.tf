#########################################
################## ROUTER ###############
#########################################


resource "google_compute_router" "my_router" {
  name    = "my-router"
  network = google_compute_network.vpc_network.id
  region  = google_compute_subnetwork.management_subnet.region
}