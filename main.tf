
resource "docker_image" "nginx" {
  name         = "nginx:alpine"
  keep_locally = true
}

resource "docker_container" "http_service" {
  name         = "terraform-http-service"
  image        = docker_image.nginx.image_id
  restart      = "unless-stopped"
  must_run     = true
  wait         = true
  wait_timeout = 60

  ports {
    internal = 80
    external = var.host_port
  }

  upload {
    file = "/usr/share/nginx/html/index.html"

    content = templatefile("${path.module}/index.html.tftpl", {
      page_title   = var.page_title
      page_message = var.page_message
    })
  }

  healthcheck {
    test         = ["CMD-SHELL", "wget -q -O /dev/null http://127.0.0.1/ || exit 1"]
    interval     = "30s"
    timeout      = "5s"
    retries      = 3
    start_period = "10s"
  }

  labels {
    label = "managed-by"
    value = "terraform"
  }

  labels {
    label = "purpose"
    value = "devops-practical-exercise"
  }
}
