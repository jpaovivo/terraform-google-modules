
# Example. Create dns zone in gcp
```
module "dns-zone" {
  source = "dasmeta/modules/google//modules/dns-zone"
  version = "0.3.0"

  project_id = "your project_id here"
  name = "example.com"
  key_path = "./key.json"
}
```
