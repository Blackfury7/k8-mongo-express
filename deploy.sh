#!/bin/bash

set -e

echo "🚀 Starting Minikube..."
minikube start

echo "📦 Applying Kubernetes resources..."
kubectl apply -f mongo-secret.yaml
kubectl apply -f mongo-configmap.yaml
kubectl apply -f mongo.yaml
kubectl apply -f mongo-express.yaml

echo "✅ Resources applied. Listing current pods and services:"
kubectl get all

echo "🌐 Accessing Mongo Express in browser..."
minikube service mongo-express-service
