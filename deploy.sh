#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

echo "Setting up Kubernetes access..."

# Ensure correct permissions
sudo mkdir -p /var/lib/jenkins/.minikube
sudo cp -r /root/.minikube/* /var/lib/jenkins/.minikube/ || { echo "Failed to copy Minikube files"; exit 1; }
sudo cp -r /root/.kube /var/lib/jenkins/
sudo chown -R jenkins:jenkins /var/lib/jenkins/.minikube /var/lib/jenkins/.kube
sudo chmod -R 755 /var/lib/jenkins/.minikube /var/lib/jenkins/.kube

# Set Kubeconfig
export KUBECONFIG=/var/lib/jenkins/.kube/config
kubectl config use-context minikube

# Display cluster information
kubectl cluster-info || { echo "Failed to connect to Kubernetes cluster"; exit 1; }

echo "Deploying application to Kubernetes..."

# Apply Kubernetes deployment
kubectl apply -f deployment.yaml || { echo "Deployment failed"; exit 1; }

echo "Deployment successful!"
