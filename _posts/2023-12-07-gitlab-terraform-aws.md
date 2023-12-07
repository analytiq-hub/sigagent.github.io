---
title: "Terraform in Gitlab for AWS"
layout: post
categories: 
---

This post goes through the steps explained in this presentation:
* Cumulus Circles: [Automate AWS Infra Deployment using Terraform and GitHub Actions](https://www.youtube.com/watch?v=scecLqTeP3k) (2022), [github](https://github.com/CumulusCycles/AWS_Terraform_CI_CD_demo)

Steps:
* Create a `code` AWS account in `AWS Organizations`.
* Assign your user as admin to the `code` AWS account in `IAM Identity Center`
* Log into the `code` AWS account as yourself
* In IAM, create `terraform` user, and give it Admin privileges