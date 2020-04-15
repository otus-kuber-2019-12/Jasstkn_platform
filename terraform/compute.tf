// Adding SSH Public Key in Project Meta Data
resource "google_compute_project_metadata_item" "ssh-keys" {
  key   = "ssh-keys"
  value = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
}

// Deploy k8s to baremetal
resource "google_compute_instance" "master" {
  name         = "master${count.index}"
  machine_type = "n1-standard-2"
  zone         = "us-central1-a"

  count        = 3

  boot_disk {
    initialize_params {
      image = "ubuntu-1804-lts"
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
  metadata = {
    sshKeys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }
}

resource "google_compute_instance" "worker" {
  name         = "worker${count.index}"
  machine_type = "n1-standard-1"
  zone         = "us-central1-b"
  count        = 2

  boot_disk {
    initialize_params {
      image = "ubuntu-1804-lts"
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
  metadata = {
    sshKeys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }
}