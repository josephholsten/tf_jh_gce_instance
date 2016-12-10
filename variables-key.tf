variable "environment" {
  description = "lifecycle environment, often useful as a key. Must match and existing environment in chef"
  default     = "dev"
}

variable "dc_region" {
  description = "datacenter region, often useful as a key"
  default     = "us-east1-c"
}

variable "role" {
  description = "server role, must match an existing role in chef"
}

variable "cohort" {
  description = "identifier for a group of servers, used for blue-green deployments, canaries, &c"
  default     = ""
}
