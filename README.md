# K8S_LAB

## Install Minikube

https://kubernetes.io/docs/setup/learning-environment/minikube/

You can also install it on macOS by downloading a stand-alone binary:

```sh
$ ccurl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64 \
  && chmod +x minikube

```
## Starting Minikube

```sh
$ minikube start -p lab_node1
```


## Dashboard
To access the Kubernetes Dashboard, run this command in a shell after starting Minikube to get the address:

```sh
$ minikube dashboard

```

## To Use Local Image 

1) You have to run eval $(minikube docker-env)
2) Build the image with the Docker daemon of Minikube

```sh
$ docker build -t collection .

```

Note: If you don't follow this step, you will get "Failed to pull image " error message