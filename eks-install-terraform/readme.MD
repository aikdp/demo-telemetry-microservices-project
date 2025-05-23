# Service Account:
1. It is for services, in genrally it is for pods, if u want to deploy a pod in eks k8s. Service needs a permision like how user need persmision. same way using SA we will give permision.
kubectl get sa -n kube-system
2. By default K8s created a SA for every namespace. having default permision like pod can run on k8s cluster.
3. If pods needs permsion to fetch the configmap or secrets to read. Should be assigned with Role or Cluster Role to SA, through role binding or cluster binding resource.

# Deployment Sacling - Healing


# Services CluserIP-NodePort-LoadBalancer
Service is to communicate with one service or pod to pod communication, and aslo if you want access the application from outsuie u can use service like NodepOrt or LoadBalancer, so user can access the application running inside the k8s cluster