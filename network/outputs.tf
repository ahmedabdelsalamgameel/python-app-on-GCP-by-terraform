
output "vpc_name_output" {
    value = google_compute_network.vpc_network.name
  
}
output "m_subnet_name_output" {
  value = google_compute_subnetwork.management_subnet.name
}
