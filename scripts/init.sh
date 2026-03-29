#!/bin/bash
# Usage: ./scripts/init.sh dev
# Usage: ./scripts/init.sh prod

ENV=${1:-local}
cd "$(dirname "$0")/../environments/$ENV"
terraform init -backend-config=./$ENV.hcl
terraform plan -backend-config=./$ENV.hcl
terraform apply -backend-config=./$ENV.hcl

# echo "Cloudflare Tunnel Token"
# terraform output tunnel_token

# echo "Stripe Webhook Secret"
# terraform output stripe_webhook_secret

# cloudflared tunnel run pawn-service