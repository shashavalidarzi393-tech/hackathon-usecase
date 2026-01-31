resource "google_container_node_pool" "primary" {
  name     = "primary"
  cluster  = google_container_cluster.gke.name
  location = var.region

  node_count = 1

  node_config {
    machine_type    = "e2-medium"
    disk_type       = "pd-standard"   # HDD
    disk_size_gb    = 20              # tiny disk
    service_account = var.service_account_email
    oauth_scopes    = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  management {
    auto_upgrade = true
    auto_repair  = true
  }
}
