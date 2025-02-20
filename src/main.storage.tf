/**
 Copyright 2024 Google. This software is provided as-is, without warranty or representation for any use or purpose. Your use of it is subject to your agreement with Google.  
 */
 
 module "create_the_build_project_tfstate" {
  source = "./modules/storage"

  for_each = {
    for projects, values in local.cloudops_project_ids : projects => values
  }

  project_id        = each.key
  region            = var.region
  env               = var.env
  generate_bucket_name = false
  attr              = "terraform-state-${each.key}"
  object_versioning = true
  force_destroy     = true
  generate_hash     = false
}




