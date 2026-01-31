module "iam" {
  source     = "../../modules/iam"
  project_id = "PROJECT_ID"
}

module "gke" {
  source                 = "../../modules/gke"
  service_account_email  = module.iam.gke_sa_email
}
