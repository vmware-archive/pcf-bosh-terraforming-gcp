resource "google_compute_address" "bosh-director" {
  name = "bosh-director"
}

resource "google_dns_record_set" "bosh-director-dns" {
  name       = "bosh.${google_dns_managed_zone.env_dns_zone.dns_name}"
  type       = "A"
  ttl        = 300

  managed_zone = "${google_dns_managed_zone.env_dns_zone.name}"

  rrdatas = ["${google_compute_address.bosh-director.address}"]
}

resource "google_compute_firewall" "bosh-director" {
  name       = "${var.env_name}-bosh-director"
  network    = "${google_compute_network.pcf-network.name}"

  allow {
    protocol = "tcp"
    ports    = [
      "25555", "22", "6868", #Bosh
      "8443", #UAA
    ]
  }

  target_tags = ["${var.env_name}-director"]
}
