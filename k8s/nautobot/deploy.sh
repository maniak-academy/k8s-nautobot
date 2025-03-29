#!/bin/bash
set -e

echo "Deploying Nautobot to Kubernetes..."

# Create namespace if it doesn't exist
kubectl create namespace nautobot --dry-run=client -o yaml | kubectl apply -f -

# Apply all manifests
kubectl apply -f secrets.yaml -n nautobot
kubectl apply -f postgres.yaml -n nautobot
kubectl apply -f redis.yaml -n nautobot
kubectl apply -f deployment.yaml -n nautobot
kubectl apply -f service.yaml -n nautobot
kubectl apply -f ingress.yaml -n nautobot

echo "Waiting for deployments to be ready..."
kubectl rollout status deployment/postgres -n nautobot
kubectl rollout status deployment/redis -n nautobot
kubectl rollout status deployment/nautobot -n nautobot

echo "Nautobot deployment complete!"
echo "Access Nautobot at: http://nautobot.maniak.lab" 