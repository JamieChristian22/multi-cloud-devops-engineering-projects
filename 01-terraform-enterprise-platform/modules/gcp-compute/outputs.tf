output "instance_name" { value = google_compute_instance.this.name }
output "public_ip" { value = google_compute_instance.this.network_interface[0].access_config[0].nat_ip }
