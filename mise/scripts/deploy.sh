#!/bin/bash

#minikube stop
#minikube delete
#minikube start
#docker-compose down
#docker-compose -f docker-compose.prod.yml down

#docker build -t handsomefencer/club:latest .

#docker push handsomefencer/club:latest

#docker-compose -f docker-compose.prod.yml up --build
doctl kubernetes cluster kubeconfig save f0046950-e72c-4ef0-91a9-53b2f42f1c61


rm -rf mise/k8s/*
kompose convert -f docker-compose.prod.yml -o mise/k8s
cp -r mise/backup/* mise/k8s/

kubectl apply -f mise/k8s/
kubectl get pods --watch

