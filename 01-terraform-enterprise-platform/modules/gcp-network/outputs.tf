output "network_id" { value = google_compute_network.this.id }
output "network_name" { value = google_compute_network.this.name }
output "public_subnet_id" { value = google_compute_subnetwork.public.id }
output "private_subnet_id" { value = google_compute_subnetwork.private.id }
