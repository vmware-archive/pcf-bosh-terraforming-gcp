output "sys_domain" {
  value = "sys.${var.env_name}.${var.dns_suffix}"
}

output "apps_domain" {
  value = "apps.${var.env_name}.${var.dns_suffix}"
}

output "tcp_domain" {
  value = "tcp.${var.env_name}.${var.dns_suffix}"
}

output "bosh_director_domain" {
  value = "${google_dns_record_set.bosh-director-dns.name}"
}

output "env_dns_zone_name_servers" {
  value = "${google_dns_managed_zone.env_dns_zone.name_servers}"
}

output "project" {
  value = "${var.project}"
}

output "region" {
  value = "${var.region}"
}

output "azs" {
  value = "${var.zones}"
}

output "service_account_key" {
  value = "${var.service_account_key}"
}

output "cf_internal_tags" {
  value = "${google_compute_firewall.cf-internal.target_tags}"
}

output "bosh_director_tags" {
  value = "${concat(google_compute_firewall.cf-internal.target_tags, google_compute_firewall.bosh-director.target_tags)}"
}

output "cf_public_tags" {
  value = "${google_compute_firewall.cf-public.target_tags}"
}

output "cf_tcp_tags" {
  value = "${google_compute_firewall.cf-tcp.target_tags}"
}

output "cf_ssh_tags" {
  value = "${google_compute_firewall.cf-ssh.target_tags}"
}

output "network_name" {
  value = "${google_compute_network.pcf-network.name}"
}

output "sql_db_ip" {
  value = "${google_sql_database_instance.master.ip_address.0.ip_address}"
}

output "sql_db_root_password" {
  value = "${google_sql_user.root.password}"
}

output "cf_gateway" {
  value = "${google_compute_subnetwork.cf-subnet.gateway_address}"
}

output "cf_cidr" {
  value = "${google_compute_subnetwork.cf-subnet.ip_cidr_range}"
}

output "cf_director_internal_ip" {
  value = "${cidrhost(google_compute_subnetwork.cf-subnet.ip_cidr_range, 3)}"
}

output "cf_subnet" {
  value = "${google_compute_subnetwork.cf-subnet.name}"
}

output "http_lb_backend_name" {
  value = "${google_compute_backend_service.http_lb_backend_service.name}"
}

output "ws_router_pool" {
  value = "${google_compute_target_pool.cf-ws.name}"
}

output "ssh_router_pool" {
  value = "${google_compute_target_pool.cf-ssh.name}"
}

output "tcp_router_pool" {
  value = "${google_compute_target_pool.cf-tcp.name}"
}

output "buildpacks_bucket" {
  value = "${google_storage_bucket.buildpacks.name}"
}

output "droplets_bucket" {
  value = "${google_storage_bucket.droplets.name}"
}

output "packages_bucket" {
  value = "${google_storage_bucket.packages.name}"
}

output "resources_bucket" {
  value = "${google_storage_bucket.resources.name}"
}

output "ert_sql_username" {
  value = "${var.ert_sql_db_username}"
}

output "ert_sql_password" {
  value = "${var.ert_sql_db_password}"
}

output "director_external_ip" {
  value = "${google_compute_address.bosh-director.address}"
}

# TEMPORARY: IP ranges will be removed when cf-deployment uses more links

output "cf_reserved_ips" {
  value = [
    "${cidrhost(google_compute_subnetwork.cf-subnet.ip_cidr_range, 2)}",
    "${cidrhost(google_compute_subnetwork.cf-subnet.ip_cidr_range, 3)}",
    "${cidrhost(google_compute_subnetwork.cf-subnet.ip_cidr_range, 254)}",
    "${cidrhost(google_compute_subnetwork.cf-subnet.ip_cidr_range, 255)}",
  ]
}

output "cf_static_ip_start" {
  value = "${cidrhost(google_compute_subnetwork.cf-subnet.ip_cidr_range, 190)}"
}

output "cf_static_ip_end" {
  value = "${cidrhost(google_compute_subnetwork.cf-subnet.ip_cidr_range, 253)}"
}
