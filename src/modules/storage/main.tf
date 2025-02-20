/**
 Copyright 2024 Google. This software is provided as-is, without warranty or representation for any use or purpose. Your use of it is subject to your agreement with Google.  
 */

locals {
  component     = "gcs"
  bucket_name   = var.generate_hash ? "${var.namespace}-${var.env}-${local.component}-${var.location}-${var.attr}-${random_id.rand.hex}" : "${var.namespace}-${var.env}-${local.component}-${var.location}-${var.attr}"
}

resource "random_id" "rand" {
  #count = var.generate_hash ? 1 : 0
  byte_length = 4
}

resource "google_kms_crypto_key_iam_member" "key-gcssa-binding" {
  count = var.encryption_key_id != null ? 1 : 0
  crypto_key_id = var.encryption_key_id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:${data.google_storage_project_service_account.gcs_account.email_address}"
}

resource "google_storage_bucket" "storage_bucket" {
  name                        = var.generate_bucket_name ? local.bucket_name : var.attr
  project                     = var.project_id
  location                    = var.region
  uniform_bucket_level_access = var.ubla
  force_destroy               = var.force_destroy

  dynamic "encryption" {
   for_each = (var.encryption_key_id != null) ? [1] : []
    content {
      default_kms_key_name = var.encryption_key_id
    }
  }

  dynamic "custom_placement_config" {
    for_each = var.multi_region ? [1] : []
    content {
      data_locations = var.data_location
    }
  }
  
  ##labels = {
  ##  "project"       = var.project_code  
  ##  "environment"   = var.env
  ##}

  dynamic "lifecycle_rule" {
    for_each = var.prefix_policies
      iterator = prefix_policy
    content {
      condition {
        age            = prefix_policy.value.age # 9
        days_since_noncurrent_time = prefix_policy.value.days_since_noncurrent_time
        matches_prefix = ["${prefix_policy.value.matches_prefix}"]  #["temp/"]
      }
      action {
        type           = "${prefix_policy.value.type}" # "Delete"
        storage_class  = "${prefix_policy.value.storage_class}" # "NEARLINE"
      }
    }
  }
  dynamic "lifecycle_rule" {
    for_each = var.general_policies
      iterator = general_policy
    content {
      condition {
        age            = general_policy.value.age # 180
        days_since_noncurrent_time = general_policy.value.days_since_noncurrent_time # required for versioned objects
      }
      action {
        type           = "${general_policy.value.type}" # "Delete"
        storage_class  = "${general_policy.value.storage_class}" # "COLDLINE"
      }
    }
  }

  versioning {
    enabled = var.object_versioning
  }
}

