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
