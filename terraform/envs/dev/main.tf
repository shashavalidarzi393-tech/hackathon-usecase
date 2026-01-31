terraform {
  required_version = ">= 1.5"

  backend "gcs" {
    bucket = "tf-state-hackathon-dev"
    prefix = "terraform/state/dev"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

module "vpc" {
  source = "../../modules/vpc"
  region = var.region       # ✅ REQUIRED
}

module "gke" {
  source = "../../modules/gke"
  project_id = var.project_id
  region     = var.region
  zone       = var.zone
  service_account_email = module.iam.gke_sa_email
}

module "iam" {
  source = "../../modules/iam"
  project_id = var.project_id
}
