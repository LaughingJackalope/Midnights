# Public Compute Engine Instance
resource "google_compute_instance" "public_instance" {
  name         = "public-instance"
  machine_type = "e2-micro"
  zone         = provider.google.zone
  tags         = ["public-instance"] # For firewall rules

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11" # Using a common Debian 11 image
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.public_subnet.id
    access_config {
      // Empty access_config assigns an ephemeral public IP
    }
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    # Install Google Cloud Ops Agent
    curl -sSO https://dl.google.com/cloudagents/add-google-cloud-ops-agent-repo.sh
    bash add-google-cloud-ops-agent-repo.sh --also-install
    # Additional setup can be added here
  EOT

  service_account {
    # Uses the default Compute Engine service account. 
    # For production, create a dedicated service account with minimal privileges.
    scopes = ["cloud-platform"] # Provides access to most GCP services
  }

  allow_stopping_for_update = true
}

# Private Compute Engine Instance
resource "google_compute_instance" "private_instance" {
  name         = "private-instance"
  machine_type = "e2-micro"
  zone         = provider.google.zone
  tags         = ["private-instance"] # For firewall rules

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11" # Using a common Debian 11 image
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.private_subnet.id
    # No access_config means no public IP
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    # Install Google Cloud Ops Agent
    curl -sSO https://dl.google.com/cloudagents/add-google-cloud-ops-agent-repo.sh
    bash add-google-cloud-ops-agent-repo.sh --also-install
    # Additional setup can be added here
  EOT

  service_account {
    scopes = ["cloud-platform"]
  }

  allow_stopping_for_update = true
}
