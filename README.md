# iac-cf



## Getting started
## Name
This is using AWS CloudFormation to provision:
- VPC
- 2 public and 2 private subnets
- 1 internet gateway
- 1 route table
- IAM instance profile for EC2 to access S3
- EC2 instance which has awscli support, installed with make, jq, and AWS CloudWatch Agent
- S3 bucket for storing sample json file
  

## Description
The objective is to download a json file from the internet, copy it to s3, and use jq to parse this json content to CloudWatch.

  
## Usage
> make deploy
This will trigger CloudFormation to provision the resources stated in the template

> make destroy
This will delete the provisioned resources


