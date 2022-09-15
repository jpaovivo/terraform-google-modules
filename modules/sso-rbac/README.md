This is a module which will configure `GKE RBAC` to sync with Google groups

```
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
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_role_binding.example](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/role_binding) | resource |
| [kubernetes_role_v1.k8s-rbac](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/role_v1) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bindings"></a> [bindings](#input\_bindings) | n/a | <pre>list(object({<br>    group     = string<br>    namespace = string<br>    roles     = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_roles"></a> [roles](#input\_roles) | n/a | <pre>list(object({<br>    actions   = list(string)<br>    resources = list(string)<br><br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->