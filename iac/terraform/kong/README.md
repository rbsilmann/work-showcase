## Overview 
This repository contains a sample of Kong Gateway demonstrating the use of Terraform to create services and routes in the gateway.

### Directory Structure
<pre>
iac/terraform/kong
├── compose.yaml              # Compose file to start Kong Gateway, run migrations, and start RabbitMQ
├── locals.tf                 # Information to create services and routes
├── main.tf                   # Main execution file
├── modules
│   └── service_and_route
│       ├── main.tf           # Main execution file of the module
│       └── variables.tf      # Variables used in the module's main.tf
├── providers.tf              # Provider configuration
├── rabbitmq
│   └── Dockerfile            # Custom RabbitMQ Docker image with additional plugins enabled
├── README.md                 # This file
├── terraform.tfvars          # Variables
└── variables.tf              # Variables used in main.tf
</pre>

### Prerequisites
1. [Docker Engine](https://docs.docker.com/engine/install/)
2. [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Running
1. Start the stack:
```bash
docker compose up -d
```
2. Initialize Terraform:
```bash
terraform init
```
3. Plan Terraform:
```bash
terraform plan
```
4. Apply Terraform:
```bash
terraform apply
```

### Tests
You can validate that the services and routes have been created in Kong Manager:
- [http://localhost:8002](http://localhost:8002)

You can access the created objects:
- [http://localhost:8000/admin-api](http://localhost:8000/admin-api)
- [http://localhost:8000/rabbitmq/](http://localhost:8000/rabbitmq/)
<<<<<<< HEAD
- [http://localhost:8000/rabbitmq-metrics](http://localhost:8000/rabbitmq-metrics)
=======
- [http://localhost:8000/rabbitmq-metrics](http://localhost:8000/rabbitmq-metrics)
>>>>>>> 419a6e9 (fix: README.md)
