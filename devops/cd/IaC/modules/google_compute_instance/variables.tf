variable "name" {
	description = "instance name"
}

variable "machine_type" {
	description = "machine type"
}

variable "zone" {
	description = "zone"
}

variable "image" {
	default=""
}

variable "startup_script" {
	default=""
}

variable "network" {
	default=""
}
