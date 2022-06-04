#!/bin/sh

docker build -f nodejs_application/Dockerfile nodejs_application -t hellworld:nodejs
helm upgrade --install helloworldnode ./helm/chart --values ./helm/values/node.yaml --debug --wait
