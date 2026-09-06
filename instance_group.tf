resource "yandex_compute_instance_group" "lamp_group" {
  name               = var.lamp_group_name
  folder_id          = var.folder_id
  service_account_id = var.sa_id
  allocation_policy {
    zones = [var.default_zone]
  }

  deploy_policy {
    max_creating     = 1
    max_deleting     = 1
    max_expansion    = 1
    max_unavailable  = 1
    startup_duration = 5
  }

  instance_template {
    platform_id = "standard-v3"

    resources {
      cores  = 4
      memory = 4
    }

    boot_disk {
      initialize_params {
        image_id = var.lamp_image_id
        size     = 20
        type     = "network-hdd"
      }
      mode = "READ_WRITE"
    }

    network_interface {
      subnet_ids = [yandex_vpc_subnet.public.id]
      ipv4       = true
      nat        = true
    }

    metadata = {
      ssh-keys = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
      "user-data" = <<-EOT
        #!/bin/bash
        apt update -y
        apt install apache2 -y
        systemctl enable apache2
        systemctl start apache2
        echo '<html><body><h1>Greetings from SLOV from LAMP VM</h1><img src="https://storage.yandexcloud.net/${yandex_storage_bucket.bucket.bucket}/picture.jpg"></body></html>' > /var/www/html/index.html
      EOT
    }
  }

  scale_policy {
    fixed_scale {
      size = 3
    }
  }

  load_balancer {
    target_group_name        = "lamp-target-group"
    target_group_description = "LAMP target group"
  }
}