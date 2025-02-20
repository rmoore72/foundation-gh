/**
 Copyright 2024 Google. This software is provided as-is, without warranty or representation for any use or purpose. Your use of it is subject to your agreement with Google.  
 */

locals {
  # THIS Projects Build Account
  build_service_account = {
    "dev" = "tfadmin@the-build-project.iam.gserviceaccount.com"
  }

  # THIS Project
  foundation_project_ids = {
    "dev" = "the-build-project" # 312070867466

  }

  # Configure all projects that will use this REPO with Project ID and Number 
  cloudops_project_ids = {
    "the-build-project" = "457691142433" 
  }

  # Cloudbuild Projects Buils Account
  cloudbuild_builder_attr = "tfadmin"
}






