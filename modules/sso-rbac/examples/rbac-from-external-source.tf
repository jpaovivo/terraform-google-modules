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
}

provider "google" {
  project = "experiments-327107"
  region  = "us-central1"
}

provider "kubernetes" {
  host  = "https://${data.google_container_cluster.my_cluster.endpoint}"
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate,
  )
}

data "google_client_config" "provider" {}

data "google_container_cluster" "my_cluster" {
  name     = "my-gke-cluster"
  location = "us-central1"
}
