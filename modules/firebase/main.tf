data "google_project" "default" {
  project_id = var.project_id
}

resource "google_firebase_project" "default" {
  provider = google-beta
  project  = data.google_project.default.project_id
}

resource "google_firebase_web_app" "basic" {
  provider     = google-beta
  project      = data.google_project.default.project_id
  display_name = var.display_name

  depends_on = [google_firebase_project.default]
}

data "google_firebase_web_app_config" "basic" {
  provider   = google-beta
  web_app_id = google_firebase_web_app.basic.app_id
  project    = data.google_project.default.project_id
}

resource "google_storage_bucket" "default" {
  provider      = google-beta
  name          = var.bucket_name
  project       = data.google_project.default.project_id
  location      = var.bucket_location
  force_destroy = true
  versioning {
    enabled = true
  }

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }
}

resource "google_storage_bucket_object" "default" {
  provider = google-beta
  bucket   = google_storage_bucket.default.name
  name     = "firebase-config.json"

  content = jsonencode({
    appId             = google_firebase_web_app.basic.app_id
    apiKey            = data.google_firebase_web_app_config.basic.api_key
    authDomain        = data.google_firebase_web_app_config.basic.auth_domain
    databaseURL       = lookup(data.google_firebase_web_app_config.basic, "database_url", "")
    storageBucket     = lookup(data.google_firebase_web_app_config.basic, "storage_bucket", "")
    messagingSenderId = lookup(data.google_firebase_web_app_config.basic, "messaging_sender_id", "")
    measurementId     = lookup(data.google_firebase_web_app_config.basic, "measurement_id", "")
  })
}
