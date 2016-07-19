# required
variable {
  role = {}
}

# Optional
variable "ssh_keys" {
  default = ""
}

variable "zone" {
  default = "josephholsten.com"
}

variable "environment" {
  description = "lifecycle environment, often useful as a key"
  default = "dev"
}

variable "chef_org" {
  description = ""
  default = "josephholsten"
}

variable "instance_count" {
  default = 1
}

variable "instance_flavor" {
  default = "f1-micro"
}

variable "dc_region" {
  description = "datacenter region, often useful as a key"
  default = "us-east1-c"
}

variable "disk_size" {
  description = "storage disk size in GiB"
  default = "20"
}

variable "disk_type" {
  description = "storage disk type"
  default = "pd-standard"
}
