resource "google_compute_instance" "kmrweb-server1" {
  name         = "kmrweb-server1"
  machine_type = "f1-micro"
  zone         = "us-west1-a"
  description  = "VCP test"
  tags         = ["kmrweb-server1"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1604-lts"
    }
  }

  network_interface {
    access_config {
      // effemeral ip address
    }
    subnetwork = "${google_compute_subnetwork.kmrweb-1.name}"
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro", "bigquery", "monitoring"]
  }

  scheduling {
    on_host_maintenance = "MIGRATE"
    automatic_restart   = true
  }
}
