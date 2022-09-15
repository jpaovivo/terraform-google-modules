module "gcp-sso-module" {
  source = "../terraform-google-modules/modules/sso-rbac"

  bindings = local.bindings
  roles    = local.roles

  cluster_location = "us-central1"
  cluster_name     = "my-gke-cluster"
}

locals {

  roles = [{
    name      = "viewers"
    actions   = ["get", "list", "watch"]
    resources = ["deployments"]
    }, {
    name      = "editors"
    actions   = ["get", "list", "watch"]
    resources = ["pods"]
  }]

  #Group syntax - gke-security-groups@DOMAIN (Member of group gke-security-group@DOMAIN)
  bindings = [{
    group     = "developers@DOMAIN"
    namespace = "development"
    roles     = ["viewers", "editors"]

    }, {
    group     = "accountants@DOMAIN"
    namespace = "accounting"
    roles     = ["editors"]
    }
  ]
}

provider "google" {
  project     = "experiments-327107"
  region      = "us-central1"
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
