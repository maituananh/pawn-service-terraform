# Pawn Service Terraform

This project uses Terraform to manage infrastructure (Infrastructure as Code) for the Pawn Service system. It automates the configuration of third-party services like Cloudflare, GitHub, Stripe, and DockerHub.

## 🔗 Related Repositories

For the system to be fully functional, you should refer to the following repositories:

- **Backend (BE):** [https://github.com/maituananh/backend](https://github.com/maituananh/backend)
- **Frontend (FE):** [https://github.com/maituananh/pawn-service-fe](https://github.com/maituananh/pawn-service-fe)
- **CI/CD Configuration:** [https://github.com/maituananh/pawn-service-cicd](https://github.com/maituananh/pawn-service-cicd)

## 📁 Directory Structure

```text
.
├── environments/          # Configuration for each environment (dev, prod)
│   ├── dev/               # Development environment
│   └── prod/              # Production environment
├── modules/               # Reusable Terraform modules
│   ├── cloudflare/        # DNS and Domain management on Cloudflare
│   ├── github/            # Webhooks (FE, BE) and Repository Secrets management on GitHub
│   ├── stripe/            # Stripe payment configuration (Webhook)
│   └── dockerhub/         # Repository management on DockerHub
└── scripts/               # Helper scripts (init.sh, destroy.sh)
```

## 🛠 Prerequisites

Before you begin, you need to install:
- [Terraform](https://www.terraform.io/downloads.html) (version >= 1.0)
- Necessary access rights for services: Cloudflare, GitHub, Stripe, DockerHub.

## 🚀 Usage Guide

### 1. Prepare Environment Variables

In each environment (e.g., `environments/dev`), create a `terraform.tfvars` file to declare secret values:

- `CLOUDFLARE_API_TOKEN`, `ZONE_ID`, `ACCOUNT_ID`.
- `GITHUB_TOKEN`, `CICD_REPO_NAME`, `FRONTEND_REPO_NAME`, `BACKEND_REPO_NAME`.
- `STRIPE_SECRET_KEY`, `STRIPE_WEBHOOK_BACKEND_URL`.
- `DOCKER_USERNAME`, `DOCKER_PASSWORD`.

### 2. Using Helper Scripts

The project provides useful scripts in the `scripts/` directory:

- **Initialize and deploy DockerHub module:**
  ```bash
  ./scripts/init.sh dev
  ```
- **Destroy created infrastructure:**
  ```bash
  ./scripts/destroy.sh dev
  ```

### 3. Manual execution with Terraform CLI

Or you can perform the steps manually:

```bash
cd environments/dev
terraform init
terraform plan
terraform apply
```

## 🔒 Security

- **WARNING:** The `terraform.tfvars` file contains sensitive information (Tokens, Passwords). **NEVER commit this file to Git.**
- The `.tfstate` files contain information about your infrastructure and may also contain sensitive data. They should be stored securely (Terraform Cloud, S3 Backend, etc.).

## ⚡ Main Managed Components

- **Cloudflare:** Manages DNS records for the domain `xxxxx.io.vn`.
- **GitHub:** Automates attaching Webhooks for Jenkins CI/CD of both Backend and Frontend.
- **Stripe:** Registers the Webhook URL to receive payment notifications.
- **DockerHub:** Creates and manages Repositories for Docker images of both Backend and Frontend.
