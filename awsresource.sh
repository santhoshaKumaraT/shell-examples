#!/bin/bash
################### This script will report the aws resource usages ###########
#Author: Santhosha Kumara T
#Date : 10-Sep-2024
#Version v1
#This script will report the resources
############################
#AWS S3
#AWS EC2
#AWS Lambda
#AWS IAM users
set -x
#list of S3 buckets
echo "List of S3 Buckets" >> resourcetracker.txt
echo "===================" >> resourcetracker.txt
aws s3 ls|awk -F " " '{print $3}' >> resourcetracker.txt

#list of EC2 instance
echo "List of EC2 Instances" >> resourcetracker.txt
echo "=======================" >> resourcetracker.txt
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> resourcetracker.txt

#list AWS Lamda functions
echo "List of Lambda Functions" >> resourcetracker.txt
echo "=========================" >> resourcetracker.txt
aws lambda list-functions | jq '.Functions[].FunctionName' >> resourcetracker.txt

#list aws IAM users
echo "List of IAM Users" >> resourcetracker.txt
echo "===================" >> resourcetracker.txt
aws iam list-users |jq '.Users[].UserName' >> resourcetracker.txt
