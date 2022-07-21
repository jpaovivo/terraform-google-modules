# Example. Create container registry
```
module "my-container-registry" {
  source  = "dasmeta/modules/google//modules/container-registry"
  version = "0.3.0"

  name     = "my-container-registry"
  project  = "my-google-project"
  location = "europe-west3-a"
}
```