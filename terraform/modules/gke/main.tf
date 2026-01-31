resource "google_container_cluster" "gke" {
  name     = "hackathon-gke"
  location = "us-central1"
  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary" {
  cluster = google_container_cluster.gke.name
  location = "us-central1"

  node_config {
    machine_type    = "e2-medium"
    service_account = var.service_account_email
    oauth_scopes    = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  node_count = 2
}
