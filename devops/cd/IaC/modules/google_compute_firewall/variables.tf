variable "name" {
	description = "firewall rule name"
}

variable "network" {
	description = "network name"
}

variable "protocol" {
	description = "machine type"
}

variable "ports" {
  type = list(string)
}

variable "source_range" {
  type = list(string)
}
