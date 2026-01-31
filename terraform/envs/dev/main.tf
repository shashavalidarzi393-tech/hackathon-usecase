terraform {
  required_version = ">= 1.5"

  backend "gcs" {
    bucket  = "tf-state-hackathon-dev"
    prefix  = "terraform/state/dev"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "iam" {
  source     = "../../modules/iam"
  project_id = var.project_id
}

module "vpc" {
  source = "../../modules/vpc"
  region = var.region
}

module "gke" {
  source                  = "../../modules/gke"
  project_id              = var.project_id
  region                  = var.region
  network                 = module.vpc.vpc_name
  service_account_email   = module.iam.gke_sa_email
}
