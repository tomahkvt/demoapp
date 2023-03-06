#!/bin/bash -xe
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube start --cpus='8' --memory='14g' --insecure-registry="registry.demoonair.com"
minikube addons enable ingress
minikube addons enable ingress-dns
minikube addons enable registry
screen -dm bash -c "minikube tunnel"

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

while ! kubectl get secret argocd-initial-admin-secret --namespace argocd;
do echo "Waiting for secret argocd-initial-admin-secret. CTRL-C to exit.";
sleep 1;
done

kubectl apply -f infrastructure/ns.yaml
kubectl apply -f infrastructure/ingress_argocd.yaml
kubectl apply -f infrastructure/ingress.yaml

while [[ 1 != $(kubectl get pods -A | grep -v "Running\|Completed" | wc -l) ]]
do echo "Waiting for pods status Running. CTRL-C to exit.";
sleep 1;
done

kubectl apply -f infrastructure/prometheus-operator.yaml
kubectl apply -f argocdapp/infrastructure.yaml

kubectl get pods -A

ARGOCD_PASSWORD=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)
echo "ARGOCD_PASSWORD: $ARGOCD_PASSWORD"


