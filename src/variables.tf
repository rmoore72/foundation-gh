/**
 Copyright 2024 Google. This software is provided as-is, without warranty or representation for any use or purpose. Your use of it is subject to your agreement with Google.  
 */
 /**
 Copyright 2024 Google. This software is provided as-is, without warranty or representation for any use or purpose. Your use of it is subject to your agreement with Google.  
 */

variable "env" {
  description = "{Required} The ENV (environment) from the Repo Branch  for the project MANDATORY - this is populated by Cloud Build TFVAR"
  type        = string
}
variable "region" {
  description = "{Required} The region where instance will be created. A subnetwork must exists in the instance region."
  type        = string
  default     = "australia-southeast1"
}
variable "ssm_instance" {
  description = "{Optional} The Secure Source Manager instance"
  type        = string
}

variable "my_user_account" {
  description = "{Required} User account to add to SSM"
  type        = string
  default     = "ryan.moore@lendlease.cloud"
}
#

# Services
variable "disable_on_destroy" {
  description = "If true, disable the service when the Terraform resource is destroyed"
  type        = bool
  default     = true
}

#Build Project Variables
variable "build_project_id" {
  description = "The GCP project ID for the build project used to deploy resources into other projects"
  type        = string
}

variable "build_project_num" {
  description = "The GCP project number for the build project used to deploy resources into other projects"
  type        = string
}