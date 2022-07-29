resource "google_compute_firewall" "allow_ssh" {
  project     = "abdelsalam-billing-account"
  name        = "allow-ssh"
  network     = var.vpc_name
  direction = "INGRESS"

  /*we use Identity-Aware Proxy (IAP) in source ranges 
  to enable administrative access to VM instances
  that do not have external IP addresses 
  or do not permit direct access over the internet.
  */
  source_ranges = [ "35.235.240.0/20" ]

  depends_on = [
    module.network
  ]
 
  allow {
    protocol  = "tcp"
    ports     = ["22"]
  }

}