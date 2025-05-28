# GCP VPC Network
resource "google_compute_network" "vpc_network" {
  name                    = "gcp-project-midnight-vpc"
  auto_create_subnetworks = false # We will create custom subnets
  routing_mode            = "REGIONAL"
}

# Public Subnet
resource "google_compute_subnetwork" "public_subnet" {
  name          = "public-subnet"
  ip_cidr_range = "10.0.1.0/24"
  network       = google_compute_network.vpc_network.id
  region        = provider.google.region
}

# Private Subnet
resource "google_compute_subnetwork" "private_subnet" {
  name          = "private-subnet"
  ip_cidr_range = "10.0.2.0/24"
  network       = google_compute_network.vpc_network.id
  region        = provider.google.region
  private_ip_google_access = true # Allows VMs without external IPs to access Google APIs & services
}

# Firewall Rules

# Allow SSH from anywhere to instances tagged "public"
resource "google_compute_firewall" "allow_ssh_public" {
  name    = "allow-ssh-public"
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["public-instance"]
}

# Allow HTTP from anywhere to instances tagged "public" (matching AWS SG)
resource "google_compute_firewall" "allow_http_public" {
  name    = "allow-http-public"
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["public-instance"]
}

# Allow SSH from instances tagged "public" to instances tagged "private"
resource "google_compute_firewall" "allow_ssh_internal_public_to_private" {
  name    = "allow-ssh-internal-public-to-private"
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_tags = ["public-instance"]
  target_tags = ["private-instance"]
}

# Allow all egress traffic (GCP default is allow, but explicit for clarity)
resource "google_compute_firewall" "allow_all_egress" {
  name    = "allow-all-egress"
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "all"
  }
  destination_ranges = ["0.0.0.0/0"]
  direction          = "EGRESS"
  priority           = 1000 # Default priority
}
