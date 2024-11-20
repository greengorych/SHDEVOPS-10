resource "yandex_compute_disk" "default" {
    for_each      = { for inst in var.each_vm : inst.vm_name => inst }
    size          = each.value.disk_volume
    type          = "network-hdd"
    zone          = var.default_zone
    image_id      = data.yandex_compute_image.ubuntu.image_id
  }

resource "yandex_compute_instance" "db" {
  for_each        = { for inst in var.each_vm : inst.vm_name => inst }
  name            = each.value.vm_name
  platform_id     = var.platform_id
  zone            = var.default_zone

  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = each.value.cpu_fr
  }

  boot_disk {
    disk_id = yandex_compute_disk.default[each.key].id
  }

  scheduling_policy {
    preemptible   = true
  }

  network_interface {
    subnet_id     = yandex_vpc_subnet.develop.id
    nat           = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = var.vms_metadata

}
