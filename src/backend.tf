/**
 Copyright 2024 Google. This software is provided as-is, without warranty or representation for any use or purpose. Your use of it is subject to your agreement with Google.  
 */

terraform {
  backend "gcs" {
    bucket = "terraform-state-${var.build_project_id}"
    prefix = "terraform/foundation-gh/dev"
  }
}

