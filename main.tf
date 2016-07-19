resource "template_file" "user-data" {
    count = "${var.instance_count}"
    template = "${file(\"${path.module}/files/user-data.yaml\")}"
    vars {
      environment = "${var.environment}"
      role = "${var.role}"
      hostname = "${var.role}-${count.index+1}.${var.zone}"
      chef_server_url = "https://api.opscode.com/organizations/${var.chef_org}"
    }
}

# resource "digitalocean_droplet" "server-instance" {
#   count     = "${var.instance_count}"
#   name      = "${var.role}-${count.index+1}"

#   image     = "ubuntu-14-04-x64"
#   region    = "${var.dc_region}"
#   size      = "${var.instance_flavor}"

#   ssh_keys  = ["${split(",", var.ssh_keys)}"]
#   user_data = "${element(template_file.user-data.*.rendered, count.index)}"

#   private_networking = true
#   ipv6               = true
#   backups            = false
# }

resource "google_compute_instance" "server-instance" {
  count     = "${var.instance_count}"
  name      = "${var.role}-${count.index+1}"

  zone = "${var.dc_region}"
  machine_type = "${var.instance_flavor}"

  disk {
    image = "ubuntu-1404-trusty-v20151113"
    size = "${var.disk_size}"
    type = "${var.disk_type}"
  }

  network_interface {
    network = "default"
    access_config {
    #   nat_ip = ""
    }
  }

  # metadata_startup_script = "${element(template_file.user-data.*.rendered, count.index)}"
}

resource "nsone_record" "ns-record-a" {
  count  = "${var.instance_count}"
  zone   = "${var.zone}"
  domain = "${var.role}-${count.index+1}.${var.zone}"
  type   = "A"
  answers {
    answer = "${element(google_compute_instance.server-instance.*.network_interface.0.access_config.0.nat_ip, count.index)}"
  }
}
