resource "google_compute_instance" "server-instance" {
  count = "${var.instance_count}"
  name  = "${var.role}-${count.index+1}${var.cohort}"

  zone         = "${var.dc_region}"
  machine_type = "${var.instance_flavor}"

  disk {
    image = "ubuntu-1404-trusty-v20151113"
    size  = "${var.disk_size}"
    type  = "${var.disk_type}"
  }

  network_interface {
    network = "default"

    access_config {
      #   nat_ip = ""
    }
  }

  provisioner "chef" {
    environment     = "${var.environment}"
    run_list        = ["role[${var.role}]"]
    node_name       = "${var.role}-${count.index+1}${var.cohort}"
    server_url      = "https://api.opscode.com/organizations/${var.chef_org}"
    recreate_client = true
    user_name       = "${var.chef_user_name}"
    user_key        = "${file(var.chef_user_key)}"
    connection {
        type = "ssh"
        user = "ubuntu"
        # password = "${var.root_password}"
    }
  }

  lifecycle {
    create_before_destroy = "true"
  }
}

# resource "nsone_record" "ns-record-a" {
#   count  = "${var.instance_count}"
#   zone   = "${var.zone}"
#   domain = "${var.role}-${count.index+1}.${var.zone}"
#   type   = "A"
#   answers {
#     answer = "${element(google_compute_instance.server-instance.*.network_interface.0.access_config.0.assigned_nat_ip, count.index)}"
#   }
# }
