#!/bin/sh
eval $(minikube docker-env)
docker build -f rails_application/Dockerfile rails_application -t helloworld:rails
helm upgrade --install helloworldrails ./helm/chart --values ./helm/values/rails.yaml --debug --wait
