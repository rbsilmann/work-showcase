## Overview 
This repository contains a sample of Kong Gateway using tools like Terraform to create services and routes in gateway.

### Directory Structure
<pre>
iac/terraform/kong
├── compose.yaml              # Compose file to start Kong Gateway, run migrations and start RabbitMQ
├── locals.tf                 # Information to create services and routes
├── main.tf                   # Principal file of execution
├── modules
│   └── service_and_route
│       ├── main.tf            Principal file of execution of module
│       └── variables.tf      # Declare variables used in main.tf of module
├── providers.tf              # Provider configuration
├── rabbitmq
│   └── Dockerfile            # Docker custom image of RabbitMQ enabling some plugins
├── README.md                 # This file
├── terraform.tfvars          # Variables
└── variables.tf              # Declare variables used in main.tf
</pre>

### Prerequisites
1. [Docker Engine](https://docs.docker.com/engine/install/)
2. [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Running
1. Start the stack:
```bash
docker compose up -d
```
2. Init Terraform:
```bash
terraform init
```
2. Plan Terraform:
```bash
terraform init
```
3. Apply Terraform:
```bash
terraform init
```

### Tests
You can validate the services and routes has been created in Kong Manager:
- [http://localhost:8002](http://localhost:8002)

You can access the created objects:
- [http://localhost:8000/admin-api](http://localhost:8000/admin-api)
- [http://localhost:8000/rabbitmq/](http://localhost:8000/rabbitmq/)
- [http://localhost:8000/rabbitmq-metrics](http://localhost:8000/rabbitmq-metrics)
