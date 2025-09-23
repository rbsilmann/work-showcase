## Overview
This repository demonstrates a GitOps implementation using ArgoCD.

### Directory Structure
<pre>
cd/argocd/
├── apps
│   ├── modsecurity
│   │   ├── configmap.yaml
│   │   ├── deployment.yaml
│   │   ├── hpa.yaml
│   │   └── service.yaml
│   └── nginx
│       ├── deployment.yaml
│       ├── hpa.yaml
│       └── service.yaml
├── argocd
│   └── app-of-apps.yaml
├── config
│   ├── modsecurity.yaml
│   └── nginx.yaml
└── README.md
</pre>

### Prerequisites
1. [Docker Engine](https://docs.docker.com/engine/install/)
2. [Minikube](https://minikube.sigs.k8s.io/docs/start/)

### Running
After installing Docker Engine and Minikube, follow these steps:

1. Create a local Kubernetes cluster:
```bash
minikube start
```

2. Install ArgoCD:
```bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

3. Install the MetalLB plugin to simulate a Load Balancer:
```bash
minikube addons enable metallb
```

4. Retrieve the network range of the Minikube container and use it to configure MetalLB:
```bash
docker container inspect minikube
```

5. Configure MetalLB using a start IP of `.10` and an end IP of `.30`:
```bash
minikube addons configure metallb
```

6. Wait until all resources are created. You can watch the progress with:
```bash
watch 'kubectl -n argocd get all'
```

7. Patch the ArgoCD server service to use a LoadBalancer:
```bash
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
```

8. Obtain the external IP of the ArgoCD server:
```bash
kubectl get svc argocd-server -n argocd -o=jsonpath='{.status.loadBalancer.ingress[0].ip}'
```

9. Default login credentials:
   - **User**: `admin`  
   - **Password**:
   ```bash
   kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
   ```

### Testing
1. Click **+ CONNECT REPO**.  
2. Choose your connection method: **VIA HTTP/HTTPS**.  
3. Set **Project** to `default`.  
4. Repository URL: **https://github.com/rbsilmann/work-showcase.git**.  
5. Click **CONNECT**.