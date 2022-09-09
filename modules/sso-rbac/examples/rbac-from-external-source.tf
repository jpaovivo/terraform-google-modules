module "roles" {
  source = "from some sorce that controlled by security specialist"
}

module "bindings" {
  source = "from some sorce that controlled by security specialist"
}

module "gcp-sso-module" {
  source = "../terraform-google-modules/modules/sso-rbac"

  bindings = module.bindings.bindings
  roles    = module.bindings.roles

  cluster_location = "us-central1"
  cluster_name     = "my-gke-cluster"
}
