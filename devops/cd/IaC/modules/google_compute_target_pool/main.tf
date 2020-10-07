resource "google_compute_target_pool" "default" {
  name = var.name

  instances = var.instances

  health_checks = var.health_checks
}
