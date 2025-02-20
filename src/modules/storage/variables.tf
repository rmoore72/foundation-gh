/**
 Copyright 2024 Google. This software is provided as-is, without warranty or representation for any use or purpose. Your use of it is subject to your agreement with Google.  
 */
variable "project_id" {
  description = "{Required} The project id for the resource"
  type        = string
}
variable "kms_project_id" {
  description = "{Optional} The project id for the KMS resources"
  type        = string
  default     = null
}
variable "env" {
  description = "{Required} The ENV (environment) from the Repo Branch  for the project MANDATORY - this is populated by Cloud Build TFVAR"
  type        = string
}
variable "region" {
  description = "{Required} The region where instance will be created."
  type        = string
}
variable "multi_region" {
  description = "{Optional} Whether to apply a multi region storage"
  type        = bool
  default     = false
}

variable "data_location" {
  description = "{Optional} The dual region data locations where instance will be created."
  type        = list(any)
  default     = null
}

#
# Naming
variable "generate_bucket_name" {
  description = "{Optional} uniform bucket level access"
  type        = bool
  default     = true
}
variable "namespace" {
  description = "{RequirOptionaled} A short (3-4 letters) abbreviation of the project name, to ensure unique IDs across projects"
  type        = string
  default     = ""
}
variable "location" {
  description = "{Optional} The region name"
  type        = string
  default     = ""
}
variable "attr" {
  description = "{Required} A short descriptional text to provide meaning tothe resource"
  type        = string
}

#
# Configuration
variable "general_policies" {
  # Optional handles empty values 
  type = map(object({
       age            = number
       days_since_noncurrent_time = number
       type           = string
       storage_class  = optional(string)
  }))
  # Default empty map required to handle optional L2 policies
  default = {}
}
variable "prefix_policies" {
  # Optional handles empty values 
  type = map(object({
       age            = number
       days_since_noncurrent_time = number
       matches_prefix = string
       type           = string
       storage_class  = optional(string)
  }))
  # Default empty map required to handle optional L2 policies
  default = {}
}
variable "encryption_key_id" {
  description = "{Optional} Encryption Key Id"
  type        = string
  default     = null
}
variable "generate_hash" {
  description = "{Optional} Generate a Hashkey into the name"
  type        = string
  default     = true
}
variable "force_destroy" {
  description = "{Optional} Terraform force destruction with objects"
  type        = bool
  default     = false
}
variable "ubla" {
  description = "{Optional} uniform bucket level access"
  type        = bool
  default     = true
}
variable "object_versioning" {
  description = "{Optional} uniform bucket level access"
  type        = bool
  default     = false
}