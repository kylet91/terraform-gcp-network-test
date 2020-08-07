data "google_compute_regions" "available" {
}

resource "google_compute_instance" "premium" {
  for_each = toset(data.google_compute_regions.available.names)
  name    = "${each.key}-premium"
  machine_type = "f1-micro"
  tags         = ["terraform"]
  zone            = "${each.key}-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network    = "default"
    access_config {
      network_tier = "PREMIUM"
    }
  }

  scheduling {
    preemptible = true
    automatic_restart = false
  }
}

resource "google_compute_instance" "standard" {
  for_each = toset(data.google_compute_regions.available.names)
  name    = "${each.key}-standard"
  machine_type = "f1-micro"
  tags         = ["terraform"]
  zone            = "${each.key}-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network    = "default"
    access_config {
      network_tier = "STANDARD"
    }
  }

  scheduling {
    preemptible = true
    automatic_restart = false
  }
}
