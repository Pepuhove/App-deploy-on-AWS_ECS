﻿# App-deploy-on-AWS
 
This project demonstrates how to deploy a Node.js application using Amazon ECS (EC2 launch type), ECR, Terraform, Docker, and GitHub Actions for CI/CD automation.

Architecture

GitHub Actions: Automates CI/CD for building and pushing Docker images.

AWS Elastic Container Registry (ECR): Stores Docker images.

AWS Elastic Container Service (ECS): Runs the containerized application.

EC2 Instances: Hosts the ECS cluster with an Auto Scaling Group.

Terraform: Provisions infrastructure on AWS.

Application Load Balancer (ALB): Routes traffic to the application.

Prerequisites

AWS Account with permissions to create ECS, ECR, EC2, and IAM roles.

Terraform installed (>= v1.0)

Docker installed

GitHub Actions configured with AWS credentials

