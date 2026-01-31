resource "google_container_cluster" "gke" {
  name     = "hackathon-gke"
  location = var.region

  network = var.network

  remove_default_node_pool = true
  initial_node_count       = 1

  deletion_protection = false
}

resource "google_container_node_pool" "primary" {
  name     = "primary"
  cluster  = google_container_cluster.gke.name
  location = var.region

  node_count = 2

  node_config {
    machine_type    = "e2-medium"
    service_account = var.service_account_email
    oauth_scopes    = ["https://www.googleapis.com/auth/cloud-platform"]

    disk_type    = "pd-standard"
    disk_size_gb = 50
  }

  management {
    auto_upgrade = true
    auto_repair  = true
  }
}
