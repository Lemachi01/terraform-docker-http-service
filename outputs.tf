
output "service_url" {
  description = "URL of the local HTTP service"
  value       = "http://localhost:${var.host_port}"
}

output "container_name" {
  description = "Name of the managed container"
  value       = docker_container.http_service.name
}

output "container_id" {
  description = "ID of the managed container"
  value       = docker_container.http_service.id
}
