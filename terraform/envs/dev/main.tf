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
}

module "iam" {
  source     = "../../modules/iam"
  project_id = var.project_id
}

module "gke" {
  source              = "../../modules/gke"
  project_id          = var.project_id
  region              = var.region
  service_account_email = module.iam.gke_node_sa_email
  network             = module.vpc.vpc_name
}
