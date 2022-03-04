# Example. Create container registry
```
module "my-container-registry" {
  source  = "dasmeta/terraform/google//modules/container-registry"
  version = "0.1.3"

  name     = "my-container-registry"
  project  = "my-google-project"
  location = "europe-west3-a"
}
```