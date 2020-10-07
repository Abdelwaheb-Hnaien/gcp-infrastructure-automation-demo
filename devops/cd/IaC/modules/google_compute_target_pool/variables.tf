variable "name" {
	description = "instance name"
}

variable "instances" {
  type = list(string)
	description = "instances"
}

variable "health_checks" {
	type = list(string)
}
