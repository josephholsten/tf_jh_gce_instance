variable "instance_count" {
  default = 1
}

variable "instance_flavor" {
  default = "f1-micro"
}

variable "disk_image" {
  description = "image to boot from"
  default     = "ubuntu-1404-trusty-v20161205"
}

variable "disk_size" {
  description = "storage disk size in GiB"
  default     = "20"
}

variable "disk_type" {
  description = "storage disk type"
  default     = "pd-standard"
}
