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
* Create Gitlab repo `aws-terraform`
  * In repo, click `Settings`, click `Secrets and variables->Actions`, `New repository secrets`
  * Add `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY
* Copy contents of [github](https://github.com/CumulusCycles/AWS_Terraform_CI_CD_demo)
  * Copy `src/*` at the top level of the `aws-terraform` sandbox
    * Change the bucket name. It must be unique across AWS.
  * Copy `.gitignore` to the top level of the `aws-terraform` sandbox
  * Don't copy the `.github` folder with the git actions just yet
  * Run `git add` at the top, check in and commit
* In `main.tf`
  * Comment out the terraform backend config for now
  * Comment out `vpc-infra` module for now
* Install `terraform` e.g. [using these instructions](https://www.linuxbuzz.com/install-terraform-on-ubuntu/)
* Source the AWS environment variables
* Run these commands:
  * `terraform init`
  * `terraform validate`
  * `terraform plan`
  * `terraform apply`
* Comment in the backend
  * Update the bucket name in the back end to match the configured bucket