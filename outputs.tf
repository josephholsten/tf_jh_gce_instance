output "instance_count" {
  value = "${var.instance_count}"
}

output "zone" {
  value = "${var.zone}"
}

output "domain" {
  value = "${var.role}-${0+1}.${var.zone}"
}

output "answers" {
#value = ["${google_compute_instance.server-instance.*.network_interface.0.access_config.0.nat_ip}"]
  value = ["${google_compute_instance.server-instance.*.network_interface.0.access_config.0.assigned_nat_ip}"]
}
