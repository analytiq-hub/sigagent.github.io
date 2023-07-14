---
title: "Kubernetes on AWS"
layout: post
categories: machine_learning airbyte dagster langchain python
---

References:
* AWS docs
  * [Getting started with Amazon EKS – eksctl](https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html)
  * [Managing the Amazon EBS CSI driver as an Amazon EKS add-on](https://docs.aws.amazon.com/eks/latest/userguide/managing-ebs-csi.html)
  * [Creating an IAM OIDC provider for your cluster](https://docs.aws.amazon.com/eks/latest/userguide/enable-iam-roles-for-service-accounts.html)

Steps
* Upgrade your `aws` cli
* Set up default profile
* `aws sso login`
* Install `eksctl`, `kubectl`
* Install the k8s cluster using managed nodes (not Fargate, b/c it would appear Fargate does not work with storage): `eksctl create cluster --name my-cluster --region region-code`
* [Deploy a sample application](https://docs.aws.amazon.com/eks/latest/userguide/sample-deployment.html)
  * `kubectl create namespace eks-sample-app`
  * `kubectl apply -f eks-sample-deployment.yaml` for yaml file on that page
  * `kubectl apply -f eks-sample-service.yaml` for yaml file on that page
  * `kubectl get all -n eks-sample-app`
  * `kubectl -n eks-sample-app describe service eks-sample-linux-service`
  * `kubectl -n eks-sample-app describe pod eks-sample-linux-deployment-xxx`
  * `kubectl exec -it eks-sample-linux-deployment-xxx -n eks-sample-app -- /bin/bash`
  * From the pod shell:
    * `curl eks-sample-linux-service; cat /etc/resolv.conf`
  * `kubectl delete namespace eks-sample-app`
* [Creating an IAM OIDC provider for your cluster](https://docs.aws.amazon.com/eks/latest/userguide/enable-iam-roles-for-service-accounts.html)
    ```bash
    export cluster_name=airbyte
    oidc_id=$(aws eks describe-cluster --name $cluster_name --query "cluster.identity.oidc.issuer" --output text | cut -d '/' -f 5)
    aws iam list-open-id-connect-providers | grep $oidc_id | cut -d "/" -f4
    # If empty, oidc provider is not set
    eksctl utils associate-iam-oidc-provider --cluster $cluster_name --approve
    ```