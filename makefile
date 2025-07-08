.PHONY: start apply access cleanup all

start:
	@echo "🚀 Starting Minikube..."
	minikube start

apply:
	@echo "📦 Applying Kubernetes resources..."
	kubectl apply -f mongo-secret.yaml
	kubectl apply -f mongo-configmap.yaml
	kubectl apply -f mongo.yaml
	kubectl apply -f mongo-express.yaml
	@kubectl get all

access:
	@echo "🌐 Accessing Mongo Express in browser..."
	minikube service mongo-express-service

cleanup:
	@echo "🧹 Cleaning up Kubernetes resources and stopping Minikube..."
	-kubectl delete -f mongo-express.yaml
	-kubectl delete -f mongo.yaml
	-kubectl delete -f mongo-configmap.yaml
	-kubectl delete -f mongo-secret.yaml
	@minikube stop

all: start apply access
