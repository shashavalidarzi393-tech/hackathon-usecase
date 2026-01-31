module "iam" {
  source     = "../../modules/iam"
  project_id = "project-e065e07a-eadd-490c-a26"
}

module "gke" {
  source                 = "../../modules/gke"
  service_account_email  = module.iam.gke_sa_email
}
