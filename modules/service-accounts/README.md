## Module allows to create/set initial configuration and resources on an new created (or even an existing old one) google cloud account

## minimal example 1) of creation an account owner level access having service account
```hcl
module "bootstrapping" {
  source  = "dasmeta/terraform/google//modules/firebase"

  project_id = "my-google-cloud-project-name"
  names = ["my-super-service-account"]
}
```

## example 2) creation an account owner level access having service account, generation of key and saving/pulling key into ./key.json file
```hcl
module "bootstrapping" {
  source  = "dasmeta/terraform/google//modules/firebase"

  project_id = "my-google-cloud-project-name"
  names = ["my-super-service-account"]
  generate_keys = true
  pull_keys     = true
}
```

## example 3) creation an account editor service account with custom editor role
```hcl
module "bootstrapping" {
  source  = "dasmeta/terraform/google//modules/firebase"

  project_id    = "my-google-cloud-project-name"
  names = ["my-super-service-account"]
  project_roles = ["my-google-cloud-project-name=>roles/editor"]
}
```

## example 3) creation of multiple service accounts with custom names roles
```hcl
module "bootstrapping" {
  source  = "dasmeta/terraform/google//modules/firebase"

  project_id    = "my-google-cloud-project-name"
  names = ["my-super-service-account-viewer", "my-super-service-account-editor"]
  project_roles = ["my-google-cloud-project-name=>roles/viewer", "my-google-cloud-project-name=>roles/editor"]

}
```

