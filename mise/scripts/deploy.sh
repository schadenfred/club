#!/bin/bash

docker-compose down
#docker-compose -f docker-compose.prod.yml build

minikube stop
minikube delete
minikube start

kompose convert -f docker-compose.prod.yml -o mise/k8s

kubectl create -f mise/k8s/
kubectl get pods --watch

#docker build -t --no-cache handsomefencer/club:latest .
#docker-compose -f docker-compose.prod.yml build --no-cache
#docker-compose -f docker-compose.prod.yml up
#docker-compose -f docker-compose.prod.yml && \
#  run --rm app bin/rails db:environment:set RAILS_ENV=production && \
# bin/setup
#db:setup RAILS_ENV=production

#docker-compose build
