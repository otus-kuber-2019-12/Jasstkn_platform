### 07 Kubernetes templating
* Created GKE cluster using terraform with remote GCS storage
* Set up nginx-ingress using helm-chart
* Set up cert-manager using helm-chart, create ClusterIssuers for provisioning certificates in automatic mode and integration with Nginx Ingress controller
* Set up and configured chartmuseum using helm-chart with backend in GCS
* Set up and configured Harbor without notary component
* Configured helmfile and structure of it
* Created two helm-chart: `hipster-shop` and `frontend` as dependency for hipster-shop, also redis was configured deployed as dependency as well
* Tested helm-secrets with PGP and GCP KMS
* Created simple script for adding custom repo for helm charts
* Configured templates based on jsonnet for kubecfg tool
* Configured `kapitan` for deployment `recommendationservice`
* Configured and deployed `productcatalogservice` using kustomzie with support new namespaces, customization a few resources and several envs.

### 06 Kubernetes networks
#### Working with testing web-app
* Added `readinessProbe` and `livenessProbe`
* Created object `Deployment`
* Create object `Service` (type: ClusterIP)
* Enable IPVS balancing mode

#### Access to application outside cluster
- Set MetalLB in Layer2 mode
- Create Service with type: LoadBalancer for web-app
- Completed task with :star:|| DNS through MetalLB
- Completed task with :star: || Ingress for Kubernetes Dashboard
- Completed task with :star: || Canary for Ingress

### 05 Kubernetes storages
* Deployed MiniO (S3 compatible storage)
* Installe commandline tools mc for Minio
* Configured Secets and patched StatefulSet for using it

## 04 Kubernetes security
* learnt AAA approach with additional fourth step
* learnt how to create ServiceAccount and bind it to something
* how to manage with different levels of access
* which types of approaches could be applied for AAA in k8s

## 03 Kubernetes controllers ##
* learnt difference between ReplicaSet and Deployment objects, ways to create, apply and track changes
* Discovered how to create different types of deployments strategies
* Learnt mechanisms for daemonsets, check tolerations and taints a bit

## 02 Kubernetes intro ##
TBD