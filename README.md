# Terraform for azure AKZ

simple terraform doe deploy Managed Kubernetes Service

### Build Cluster

```sh

terraform version
az account list
# [ {
#     "cloudName": "AzureCloud",
#     "homeTenantId": "...",
#     "id": "abcde..",
#     "isDefault": true,
#     "managedByTenants": [],
#     "name": "Azure...",
#     "state": "Enabled",
#     "tenantId": "...",
#     "user": {
#       "name": "xyzz@xxx.com",
#       "type": "user"
#     }
# }]


az account set --subscription="abcde.."

az ad sp create-for-rbac \
  --role="Contributor" \
  --scopes="/subscriptions/abcde.."

export ARM_CLIENT_ID=<insert the appId from above>
export ARM_SUBSCRIPTION_ID=<insert your subscription id>
export ARM_TENANT_ID=<insert the tenant from above>
export ARM_CLIENT_SECRET=<insert the password from above>


terraform init
terraform plan
terraform apply

export KUBECONFIG="${PWD}/kubeconfig-dev.yaml"


terraform destroy

```


## Deploy services

```sh
kubectl apply -f k8s/app1–deployment.yaml
kubectl apply -f k8s/app2–deployment.yaml
kubectl apply -f k8s/app3–deployment.yaml
kubectl apply -f k8s/service1.yaml
kubectl apply -f k8s/service2.yaml
kubectl apply -f k8s/service3.yaml
kubectl apply -f k8s/ingress.yaml
```