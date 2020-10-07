terraform {
  backend "gcs" {
    bucket  = "{{ Backend.bucket }}"
    prefix  = "{{ Backend.prefix }}"
    credentials = "{{ Backend.credentials }}"
  }
}
