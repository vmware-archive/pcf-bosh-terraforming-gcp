// Allow open access between internal VMs for a PCF deployment
resource "google_compute_firewall" "cf-internal" {
  name       = "${var.env_name}-cf-internal"
  depends_on = ["google_compute_network.pcf-network"]
  network    = "${google_compute_network.pcf-network.name}"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  target_tags = ["${var.env_name}-vms"]

  source_tags = [
    "${var.env_name}-vms",                  // Allows VMs deployed by bosh to talk to one another
  ]
}
