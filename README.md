
# Terraform Docker HTTP Service

## Overview

A local Nginx HTTP service managed using Terraform and Docker.

## Requirements

- Linux or WSL
- Docker Engine accessible to Terraform
- Terraform 1.5 or later
- Git

## Deploy

Initialize the provider:

```bash
terraform init
```

Format and validate:

```bash
terraform fmt
terraform validate
```

Preview and deploy:

```bash
terraform plan
terraform apply
```

Open http://localhost:8080.

## Update content

```bash
terraform apply -var='page_message="Updated content from Terraform."'
```

## Change the port

```bash
terraform apply -var='host_port=8081'
```

Open http://localhost:8081.

## Verify

```bash
curl -i http://localhost:8080
docker ps --filter "name=terraform-http-service"
docker inspect --format '{{.State.Health.Status}}' terraform-http-service
docker inspect --format '{{.HostConfig.RestartPolicy.Name}}' terraform-http-service
```

## Cleanup

```bash
terraform destroy
```

## Design decisions

- Nginx provides the HTTP service.
- Terraform manages the Docker image and container.
- Port and content are configurable.
- Docker health checks monitor HTTP availability.
- The restart policy is unless-stopped.
- Terraform state is local and excluded from Git.
