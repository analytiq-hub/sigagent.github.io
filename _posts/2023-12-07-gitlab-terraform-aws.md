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
* In `IAM`, create `terraform` user, and give it Admin privileges
* Create Access Keys for the `terraform` user
  * In the user details page, navigate to the `Security credentials` tab.
    * Under the “Access keys” section, click on `Create access key`.
    * Download and Store the Keys Safely:
  * Once the access key is created, AWS will offer you the option to download the key as a .csv file. This file contains the Access Key ID and Secret Access Key.
  * Download and save this file in a secure location. This is the only time AWS will display the Secret Access Key. If you lose it, you'll have to create a new access key.