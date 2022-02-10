#!/bin/bash

# To download binary on windows
curl.exe -Lo kind-windows-amd64.exe https://kind.sigs.k8s.io/dl/v0.11.1/kind-windows-amd64

# Make exuction mode
chmod +x  ./kind-windows-amd64.exe 

# Move file to PATH 
mv ./kind-windows-amd64.exe c/windows

# Create cluster using Kind

kind create cluster --config ./kind-config.yaml

# Addons

echo "Deploy metrics server to  monitor resource usage on cluster" # Required for HPA

kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.4.2/components.yaml

echo "Install MetalLB"

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.11.0/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.11.0/manifests/metallb.yaml

echo "Configure MetalLB"

kubectl apply -f metallb-cm.yaml
