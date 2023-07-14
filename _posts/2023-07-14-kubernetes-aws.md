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
