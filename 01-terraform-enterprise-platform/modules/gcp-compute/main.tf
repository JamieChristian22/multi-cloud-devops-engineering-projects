resource "google_compute_instance" "this" {
  name="${var.name_prefix}-vm"; machine_type=var.machine_type; zone=var.zone; tags=["web"]
  boot_disk { initialize_params { image="debian-cloud/debian-12" } }
  network_interface { subnetwork=var.public_subnet_id; access_config {} }
  metadata_startup_script = <<-EOT
#!/bin/bash
apt-get update
apt-get install -y nginx
echo "Terraform Enterprise Platform" > /var/www/html/index.html
systemctl enable --now nginx
EOT
}
