# This module intended to add Dns zone on GCP:

## minimal module setup
```terraform
module "dns-zone" {
    source = "dasmeta/terraform/google//modules/dns-zone"
    version = "0.1.0"
}
``` 
