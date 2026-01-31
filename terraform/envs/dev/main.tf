module "iam" {
  source     = "../../modules/iam"
  project = var.project_id
}

module "gke" {
  source                 = "../../modules/gke"
  service_account_email  = module.iam.gke_sa_email
}
