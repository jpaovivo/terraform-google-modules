terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    google = {
      source  = "hashicorp/google"
      version = "~> 4.63"
    }
  }
}

provider "google" {
  project     = "casino123"                                                                                        //var.project_id
  credentials = "/Users/Vika/Documents/projects/play-engine/genesis-devops/terraform_gcp/envs/casino123/cred.json" //var.GOOGLE_CREDENTIALS
}
