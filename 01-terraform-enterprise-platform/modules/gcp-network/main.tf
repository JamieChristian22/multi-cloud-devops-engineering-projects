resource "google_compute_network" "this" {
  name="${var.name_prefix}-vpc"; auto_create_subnetworks=false
}
resource "google_compute_subnetwork" "public" {
  name="${var.name_prefix}-public"; ip_cidr_range=cidrsubnet(var.vpc_cidr,8,0); region=var.region; network=google_compute_network.this.id
}
resource "google_compute_subnetwork" "private" {
  name="${var.name_prefix}-private"; ip_cidr_range=cidrsubnet(var.vpc_cidr,8,10); region=var.region; network=google_compute_network.this.id
  private_ip_google_access=true
}
resource "google_compute_router" "this" { name="${var.name_prefix}-router"; region=var.region; network=google_compute_network.this.id }
resource "google_compute_router_nat" "this" {
  name="${var.name_prefix}-nat"; router=google_compute_router.this.name; region=var.region
  nat_ip_allocate_option="AUTO_ONLY"; source_subnetwork_ip_ranges_to_nat="ALL_SUBNETWORKS_ALL_IP_RANGES"
}
resource "google_compute_firewall" "http" {
  name="${var.name_prefix}-allow-http"; network=google_compute_network.this.name
  allow { protocol="tcp"; ports=["80"] }
  source_ranges=["0.0.0.0/0"]; target_tags=["web"]
}
resource "google_compute_firewall" "ssh" {
  name="${var.name_prefix}-allow-ssh"; network=google_compute_network.this.name
  allow { protocol="tcp"; ports=["22"] }
  source_ranges=[var.admin_cidr]; target_tags=["web"]
}
