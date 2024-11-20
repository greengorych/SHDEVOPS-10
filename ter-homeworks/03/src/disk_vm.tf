resource "yandex_compute_disk" "storage" {
  count          = 3
  name           = "disk-${count.index + 1}"
  size           = 5
  type           = "network-hdd"
  zone           = var.default_zone
  image_id       = data.yandex_compute_image.ubuntu.image_id
}

resource "yandex_compute_instance" "storage" {
  name                 = "storage"
  platform_id          = var.platform_id
  zone                 = var.default_zone

  resources {
    cores              = 2
    memory             = 1
    core_fraction      = 20
  }

  boot_disk {
    initialize_params {
      image_id    = data.yandex_compute_image.ubuntu.image_id
    }
  }

  dynamic "secondary_disk" {
    for_each           = toset(yandex_compute_disk.storage.*.id)
    content {
      disk_id          = secondary_disk.value
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  scheduling_policy {
    preemptible   = true
  }

  metadata = {
    serial-port-enable = var.vms_metadata.serial-port-enable
    ssh-keys           = "ubuntu:${local.ssh_public_key}"
  }

}
