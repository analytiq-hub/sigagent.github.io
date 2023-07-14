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
    # Now, you can list it with the prev command
    ```
* [Creating the Amazon EBS CSI driver IAM role](https://docs.aws.amazon.com/eks/latest/userguide/csi-iam-role.html)
    ```bash
    eksctl create iamserviceaccount \
    --name ebs-csi-controller-sa \
    --namespace kube-system \
    --cluster airbyte \
    --role-name AmazonEKS_EBS_CSI_DriverRole_airbyte \
    --role-only \
    --attach-policy-arn arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy \
    --approve

    eksctl create addon --name aws-ebs-csi-driver --cluster airbyte --service-account-role-arn arn:aws:iam::694782716000:role/AmazonEKS_EBS_CSI_DriverRole_airbyte --force
    ```
* [Deploy a sample application and verify that the CSI driver is working](https://docs.aws.amazon.com/eks/latest/userguide/ebs-sample-app.html)
    ```bash
    git clone https://github.com/kubernetes-sigs/aws-ebs-csi-driver.git
    cd aws-ebs-csi-driver/examples/kubernetes/dynamic-provisioning/
    echo "parameters:
      type: gp3" >> manifests/storageclass.yaml
    kubectl apply -f manifests/
    kubectl get pods --watch
    # Wait for app pod to be running
    kubectl get pv
    kubectl describe pv pvc-xxx
    kubectl exec -it app -- cat /data/out.txt
    kubectl delete -f manifests/
    ```
* Create a namespace, and install Airbyte:
    ```bash
    kubectl create namespace airbyte
    helm install airbyte airbyte/airbyte --version 0.45.50 --namespace airbyte --debug
    ```