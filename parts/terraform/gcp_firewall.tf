resource "google_compute_firewall" "kmrwebWebserver" {
  name = "webserver"
  network = "${google_compute_network.kmrweb.name}"
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }
  target_tags = ["${google_compute_instance.kmrweb-server1.tags}"]
}
