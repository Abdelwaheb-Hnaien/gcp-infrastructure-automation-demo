provider "google" {
  project     =  "{{ Google.project }}"
  region      =  "{{ Google.region }}"
}

{% if Buckets is defined and Buckets|length %}
{% for Bucket in Buckets %}
module cloud_storage_bucket_{{ Bucket.name }} {
  source        = "/workspace/devops/cd/IaC/modules/cloud_storage_bucket"
  bucket_name    = "{{ Bucket.name }}"
}
{% endfor %}
{% endif %}


{% if Instances is defined and Instances|length %}
{% for Instance in Instances %}
module google_compute_instance_{{ Instance.name }} {
  source         = "/workspace/devops/cd/IaC/modules/google_compute_instance"
  name           = "{{ Instance.name }}"
  machine_type   = "{{ Instance.machine_type }}"
  zone           = "{{ Instance.zone }}"
  image          = "{{ Instance.image }}"
  startup_script = "${file("/workspace/devops/packages/{{ Instance.startup_script }}")}"
  network        = "{{ Instance.network }}"
}
{% endfor %}
{% endif %}

{% if Compute_target_pools is defined and Compute_target_pools|length %}
{% for Compute_target_pool in Compute_target_pools %}
module google_compute_target_pool_{{Compute_target_pool.name}} {
  source       = "/workspace/devops/cd/IaC/modules/google_compute_target_pool"
  name         = "{{ Compute_target_pool.name }}"
  instances    = [
                  {% for Instance in Compute_target_pool.instances %}
                   "${module.google_compute_instance_{{ Instance }}.self_link}",
                  {% endfor %}
                ]

  health_checks = [
                  {% for health_check in Compute_target_pool.health_checks %}
                   "${module.google_compute_http_health_check_{{ health_check }}.name}",
                  {% endfor %}
                ]
}
{% endfor %}
{% endif %}

{% if Health_checks is defined and Health_checks|length %}
{% for Health_check in Health_checks %}
module google_compute_http_health_check_{{ Health_check.name }} {
  source             = "/workspace/devops/cd/IaC/modules/google_compute_http_health_check"
  name               = "{{ Health_check.name }}"
  request_path       = "{{ Health_check.request_path }}"
  check_interval_sec = {{ Health_check.check_interval_sec }}
  timeout_sec        = {{ Health_check.timeout_sec }}
}
{% endfor %}
{% endif %}

{% if Forwarding_rules is defined and Forwarding_rules|length %}
{% for Forwarding_rule in Forwarding_rules %}
module google_compute_forwarding_rule_{{ Forwarding_rule.name }} {
  source     = "/workspace/devops/cd/IaC/modules/google_compute_forwarding_rule"
  name       = "{{ Forwarding_rule.name }}"
  target     = "${module.google_compute_target_pool_{{ Forwarding_rule.target }}.self_link}"
  port_range = {{ Forwarding_rule.port_range }}
}
{% endfor %}
{% endif %}
