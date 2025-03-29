# Nautobot on Kubernetes

This repository contains Kubernetes manifests for deploying Nautobot on a Kubernetes cluster.

## Prerequisites

- A working Kubernetes cluster
- `kubectl` configured to communicate with your cluster
- Kubernetes Ingress controller (like NGINX Ingress) installed

## Deployment

1. Clone this repository:
   ```
   git clone https://github.com/yourusername/k8s-nautobot.git
   cd k8s-nautobot
   ```

2. Modify the secrets in `k8s/nautobot/secrets.yaml` with secure values:
   - `db-password`: PostgreSQL database password
   - `secret-key`: Django secret key (generate with `openssl rand -hex 32`)
   - `superuser-password`: Initial admin password

3. Update the hostname in `k8s/nautobot/ingress.yaml` to match your domain.

4. Deploy Nautobot:
   ```
   cd k8s/nautobot
   ./deploy.sh
   ```

5. Access Nautobot at the URL specified in your ingress configuration.

## Components

- Nautobot application
- PostgreSQL database
- Redis for caching
- Kubernetes services and ingress

## Notes

- This deployment uses `emptyDir` volumes for databases, which are ephemeral. For production, consider using persistent volumes.
- Default admin credentials are:
  - Username: admin
  - Email: admin@example.com
  - Password: (specified in secrets.yaml)

## Customization

You can customize the deployment by editing the YAML files:
- Adjust resource limits in deployment files
- Add additional environment variables
- Configure persistent storage