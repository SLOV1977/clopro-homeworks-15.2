resource "yandex_lb_network_load_balancer" "network_lb" {
  name      = var.network_nlb
  folder_id = var.folder_id
  type      = "external"

  listener {
    name        = "lamp-listener"
    port        = 80
    protocol    = "tcp"
    target_port = 80

    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_compute_instance_group.lamp_group.load_balancer[0].target_group_id

    healthcheck {
      name = "http"

      http_options {
        port = 80
        path = "/"
      }
    }
  }
}