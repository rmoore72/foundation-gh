/**
 Copyright 2024 Google. This software is provided as-is, without warranty or representation for any use or purpose. Your use of it is subject to your agreement with Google.  
 */

output "storage_bucket_name" {
  value       = google_storage_bucket.storage_bucket.name
  description = "Storage resources being provisioned."
}
