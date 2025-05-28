terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = "YOUR_GCP_PROJECT_ID" # TODO: Replace with your GCP project ID
  region  = "us-central1"          # TODO: Replace with your desired region
  zone    = "us-central1-a"        # TODO: Replace with your desired zone
}

# Optional: Configure a GCS backend for Terraform state
# terraform {
#   backend "gcs" {
#     bucket  = "your-terraform-state-bucket-name" # TODO: Replace with your GCS bucket name
#     prefix  = "terraform/state"
#   }
# }
