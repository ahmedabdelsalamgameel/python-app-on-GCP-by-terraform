resource "google_compute_instance" "private_vm" {
  name         = "private-vm"
  machine_type = "e2-micro"
  zone         = "europe-west1-b"
  allow_stopping_for_update = true

  depends_on = [
    google_container_cluster.private_gke_cluster
   , google_container_node_pool.nodepool
  ]

  
  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
      size = 20
    
    }
  }
 
  network_interface {
    network = module.network.vpc_name_output
    subnetwork = module.network.m_subnet_name_output
  }
  service_account {
        email = google_service_account.vm_service_account.email
        scopes = [ "cloud-platform" ] 
}

}