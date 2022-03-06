#!/bin/bash

minikube stop
minikube delete

#doctl kubernetes cluster kubeconfig save 410c65eb-8e10-440a-9540-d185e41d6d02
#docker-compose down
#docker-compose -f docker-compose.prod.yml down

#docker build -t handsomefencer/club:latest .

#docker push handsomefencer/club:latest

#docker-compose -f docker-compose.prod.yml up --build

rm -rf mise/k8s/*
kompose convert -f docker-compose.prod.yml -o mise/k8s
cp -r mise/backup/* mise/k8s/
#minikube start

kubectl apply -f mise/k8s/
kubectl get pods --watch

#docker-compose -f docker-compose.prod.yml build --no-cache
#docker-compose -f docker-compose.prod.yml up
#docker-compose -f docker-compose.prod.yml && \
#  run --rm app bin/rails db:environment:set RAILS_ENV=production && \
# bin/setup
#db:setup RAILS_ENV=production

#docker-compose build
