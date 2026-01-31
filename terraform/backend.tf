terraform {
  backend "gcs" {
    bucket  = "terraform-state-hackathon"
    prefix  = "gke"
  }
}
