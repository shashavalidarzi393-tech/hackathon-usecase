resource "google_compute_network" "vpc" {
  name = "hackathon-vpc"
  auto_create_subnetworks = false
}