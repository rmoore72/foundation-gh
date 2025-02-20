/**
 Copyright 2024 Google. This software is provided as-is, without warranty or representation for any use or purpose. Your use of it is subject to your agreement with Google.  
 */

locals {}

resource "google_project_service" "foundation_project_services" {
  project      = local.foundation_project_ids[var.env]
  for_each = toset(
    [
      "secretmanager.googleapis.com","cloudresourcemanager.googleapis.com","securesourcemanager.googleapis.com","serviceusage.googleapis.com","cloudbuild.googleapis.com","compute.googleapis.com"
    ]
  )
  service                    = each.key
  disable_on_destroy         = false
  disable_dependent_services = true
  timeouts {
    create = "5m"
    update = "5m"
  }
}






