#!/bin/bash
echo "INFO doing a docker search =================================="
which docker

if [ $? -eq 0 ]
then
    docker --version | grep "Docker version"
    if [ $? -eq 0 ]
    then
        echo "INFO docker exists"
	echo "INFO Attempting to get library"
	docker image ls
    else
        echo "ERROR docker failed"
    fi
else
    echo "INFO docker does not exist" >&2
fi

echo "INFO doing a kubectl search =================================="

which kubectl

if [ $? -eq 0 ]
then
    kubectl version --client=true
    if [ $? -eq 0 ]
    then
        echo "INFO kubectl exists"
    else
        echo "ERROR kubectl version failed"
    fi
else
    echo "INFO kubectl does not exist" >&2
fi

echo "INFO doing a minikube search ================================="
which minikube

if [ $? -eq 0 ]
then
    minikube version
    if [ $? -eq 0 ]
    then
        echo "INFO minikube exists"
 	echo "INFO attempting to search minikube image library"
	eval $(minikube docker-env)
	docker image ls
    else
        echo "ERROR minikube version failed"
    fi
else
    echo "INFO minikube does not exist" >&2
fi
