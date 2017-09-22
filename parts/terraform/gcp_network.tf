resource "google_compute_network" "kmrweb" {
  name = "kmrweb"
}
resource "google_compute_subnetwork" "kmrweb-1" {
  name          = "kmrweb-1"
  ip_cidr_range = "172.17.1.0/24"
  network       = "${google_compute_network.kmrweb.name}"
  description   = "Trial VCP"
  region        = "us-west1"
}
resource "google_compute_subnetwork" "kmrweb-2" {
  name          = "kmrweb-2"
  ip_cidr_range = "172.17.2.0/24"
  network       = "${google_compute_network.kmrweb.name}"
  description   = "Trial VCP"
  region        = "us-west1"
}
