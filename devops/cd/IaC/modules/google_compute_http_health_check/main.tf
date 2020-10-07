resource "google_compute_http_health_check" "default" {
  name               = var.name
  request_path       = var.request_path
  check_interval_sec = var.check_interval_sec
  timeout_sec        = var.timeout_sec
}
