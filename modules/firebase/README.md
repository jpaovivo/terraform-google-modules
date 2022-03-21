# Example. Create firebase
```
module "my-firebase" {
  source  = "dasmeta/terraform/google//modules/firebase"
  
  project_id      = "" # Google cloud project id
  display_name    = "" # The user-assigned display name of the App.
  bucket_name     = "" # The name of the bucket.
  bucket_location = "" # The GCS location
}
```