resource "google_compute_instance" "instance" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  metadata = {
    startup-script = var.startup_script
  }

  network_interface {
  network = var.network

    access_config {
      // Ephemeral IP
    }
  }

}
