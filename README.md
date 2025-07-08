# 🚀 MongoDB + Mongo Express on Minikube

This project demonstrates how to deploy **MongoDB** with **Mongo Express** on a local **Minikube** Kubernetes cluster. It's a simple, clean setup using core Kubernetes components such as **Secrets**, **ConfigMaps**, **Deployments**, and **Services**.

---


## 📁 Project Structure

```bash
.
├── mongo-secret.yaml           # Kubernetes Secret for MongoDB credentials
├── mongo-configmap.yaml        # ConfigMap with non-sensitive settings
├── mongo.yaml                  # MongoDB Deployment and Service
├── mongo-express.yaml          # Mongo Express Deployment and Service
├── deploy.sh                   # Bash script to start Minikube and apply manifests
├── cleanup.sh                  # Bash script to delete all resources and stop Minikube
├── Makefile                    # Makefile with useful automation commands
├── README.md                   # Project documentation
```

## 📦 What’s Inside

This project includes the following Kubernetes manifest files:

### ✅ `mongo-secret.yaml`
- Defines a **Kubernetes Secret** that securely stores:
  - MongoDB username
  - MongoDB password
- These credentials are mounted as environment variables in both MongoDB and Mongo Express pods.

### ✅ `mongo-configmap.yaml`
- Contains non-sensitive configuration values:
  - MongoDB database name
  - Mongo host (used by Mongo Express)
- Keeps configuration separate from the application logic.

### ✅ `mongo.yaml`
- Deploys MongoDB as a **Deployment** and exposes it via a **ClusterIP Service**.
- Pulls the official `mongo` image.
- Injects the secret and config map values into the container environment.

### ✅ `mongo-express.yaml`
- Deploys **Mongo Express** (a web-based MongoDB admin interface) as a Deployment.
- Exposes it through a **NodePort Service** for browser access via Minikube.
- Uses the same secrets/config maps to connect to MongoDB.

---

## 🛠️ Prerequisites


- [Minikube](https://minikube.sigs.k8s.io/docs/start/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)

---

## 🚀 Getting Started

1. **Start Minikube:**

   ```bash
   minikube start
   ```
2. **Apply Kubernetes Resources:**
Apply all the YAML files in order:

```bash
    kubectl apply -f mongo-secret.yaml
    kubectl apply -f mongo-configmap.yaml
    kubectl apply -f mongo.yaml
    kubectl apply -f mongo-express.yaml
   ```

Verify that the pods and services are running:

```bash
   kubectl get all
   ```

3. **Access Mongo Express in Browser:**
 
 ```bash
   minikube service mongo-express-service
   ```
4. **Cleanup:**

```bash
    kubectl delete -f mongo-express.yaml
    kubectl delete -f mongo.yaml
    kubectl delete -f mongo-configmap.yaml
    kubectl delete -f mongo-secret.yaml
    minikube stop
   ```






