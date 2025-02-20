/**
 Copyright 2024 Google. This software is provided as-is, without warranty or representation for any use or purpose. Your use of it is subject to your agreement with Google.  
 */

locals {}



### Resources to build the cloudops projects


resource "google_project_iam_member" "builder_sa_cloudops_projects_editor" {
  project = var.build_project_id
  role    = "roles/editor"
  member  = "serviceAccount:${local.cloudbuild_builder_attr}@${var.build_project_num}.iam.gserviceaccount.com"
}


resource "google_project_iam_member" "builder_sa_cloudops_projects_sauser" {
  project = var.build_project_id
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${local.cloudbuild_builder_attr}@${var.build_project_num}.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "builder_sa_cloudops_projects_satokencreator" {
  project = var.build_project_id
  role    = "roles/iam.serviceAccountTokenCreator"
  member  = "serviceAccount:${local.cloudbuild_builder_attr}@${var.build_project_num}.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "builder_sa_cloudops_projects_reporeader" {
  project = var.build_project_id
  role    = "roles/cloudbuild.builds.builder"
  member  = "serviceAccount:${local.cloudbuild_builder_attr}@${var.build_project_num}.iam.gserviceaccount.com"
} 


