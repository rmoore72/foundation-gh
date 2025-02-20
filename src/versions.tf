/**
 Copyright 2024 Google. This software is provided as-is, without warranty or representation for any use or purpose. Your use of it is subject to your agreement with Google.  
 */

terraform {
  required_version = ">= 1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~>6.12"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~>6.12"
    }
    null = {
      source  = "hashicorp/null"
      version = "~>3.2"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.6"
    }
  }
}