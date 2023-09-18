#!/bin/bash

# Define the name of your Kind cluster
CLUSTER_NAME="kind-example"

# Check if Kind is already installed
if ! command -v kind &> /dev/null; then
  echo "Kind is not installed. Installing Kind..."
  # Download and install Kind
  curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.0/kind-linux-amd64
  chmod +x ./kind
  sudo mv ./kind /usr/local/bin/
fi

# Create a Kind cluster
echo "Creating Kind cluster: $CLUSTER_NAME"
kind create cluster --name $CLUSTER_NAME

# Configure kubectl to use the Kind cluster
echo "Configuring kubectl to use the Kind cluster"
kubectl cluster-info --context kind-$CLUSTER_NAME

# Display cluster nodes
echo "Cluster nodes:"
kubectl get nodes