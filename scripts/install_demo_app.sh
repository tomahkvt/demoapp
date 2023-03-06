#!/bin/bash -xe
cd istio-test-images/0.0.1
make build && make push
cd ../../istio-test-images/0.0.2
make build && make push
cd ../../istio-test-images/0.0.3
make build && make push
cd ../../
kubectl apply -f argocdapp/app.yaml