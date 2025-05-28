# Cloud Router
resource "google_compute_router" "router" {
  name    = "gcp-project-midnight-router"
  network = google_compute_network.vpc_network.id
  region  = google_compute_subnetwork.public_subnet.region # Router must be in the same region as the subnets it serves
}

# Cloud NAT Gateway
resource "google_compute_router_nat" "nat_gateway" {
  name                               = "gcp-project-midnight-nat-gateway"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    = google_compute_subnetwork.private_subnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}
