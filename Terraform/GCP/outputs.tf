output "public_instance_ip" {
  description = "The public IP address of the public Compute Engine instance."
  value       = google_compute_instance.public_instance.network_interface[0].access_config[0].nat_ip
}

output "private_instance_ip" {
  description = "The private IP address of the private Compute Engine instance."
  value       = google_compute_instance.private_instance.network_interface[0].network_ip
}

output "vpc_network_name" {
  description = "The name of the VPC network."
  value       = google_compute_network.vpc_network.name
}

output "public_subnet_name" {
  description = "The name of the public subnet."
  value       = google_compute_subnetwork.public_subnet.name
}

output "private_subnet_name" {
  description = "The name of the private subnet."
  value       = google_compute_subnetwork.private_subnet.name
}
