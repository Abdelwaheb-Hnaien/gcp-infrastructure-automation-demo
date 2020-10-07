variable "name" {
	description = "instance name"
}

variable "request_path" {
	description = "machine type"
}

variable "check_interval_sec" {
	type = number
}

variable "timeout_sec" {
	type = number
}
