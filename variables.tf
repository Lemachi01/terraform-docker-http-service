
variable "host_port" {
  description = "Host port for the HTTP service"
  type        = number
  default     = 8080

  validation {
    condition     = var.host_port >= 1 && var.host_port <= 65535
    error_message = "host_port must be between 1 and 65535."
  }
}

variable "page_title" {
  description = "Title shown on the web page"
  type        = string
  default     = "Terraform Managed HTTP Service"
}

variable "page_message" {
  description = "Custom message shown on the web page"
  type        = string
  default     = "Deployment successful: managed with Terraform and Docker."
}
