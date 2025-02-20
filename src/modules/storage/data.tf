/**
 Copyright 2024 Google. This software is provided as-is, without warranty or representation for any use or purpose. Your use of it is subject to your agreement with Google.  
 */
data "google_project" "project" {
  count = var.encryption_key_id != null ? 1 : 0
  project_id = var.kms_project_id
}

data "google_storage_project_service_account" "gcs_account" {
  project = var.project_id
}
