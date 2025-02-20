/**
 Copyright 2024 Google. This software is provided as-is, without warranty or representation for any use or purpose. Your use of it is subject to your agreement with Google.  
 */


data "google_project" "foundation_project" {
  project_id = local.foundation_project_ids[var.env]
}
