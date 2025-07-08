#!/bin/bash

set -e

echo "🗑️ Deleting Kubernetes resources..."
kubectl delete -f mongo-express.yaml || true
kubectl delete -f mongo.yaml || true
kubectl delete -f mongo-configmap.yaml || true
kubectl delete -f mongo-secret.yaml || true

echo "🛑 Stopping Minikube..."
minikube stop

echo "✅ Cleanup complete."
