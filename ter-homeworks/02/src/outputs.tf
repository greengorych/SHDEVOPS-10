output "platform" {
  value = {
    instance_name = yandex_compute_instance.platform.name
    external_ip   = yandex_compute_instance.platform.network_interface.0.nat_ip_address
    fqdn          = yandex_compute_instance.platform.fqdn
  }
}
output "database" {
  value = {
    instance_name = yandex_compute_instance.database.name
    external_ip   = yandex_compute_instance.database.network_interface.0.nat_ip_address
    fqdn          = yandex_compute_instance.database.fqdn
  }
}
