# aws-vpc-devops-ninja-999
AWS -Devops-Jenkins-Ansible-Terraform

# 🚀 AWS DevOps Ninja assignment

This repository demonstrates a complete DevOps setup on AWS using **Terraform**, **Ansible**, and **Jenkins** for automating the build and deployment of a containerized Node.js application.

## 📘 Project Overview
Components provisioned:
- Multi-AZ VPC with public/private subnets
- Bastion host, Jenkins, and App EC2 instances
- ALB for Jenkins and App access
- ECR for Docker image storage
- S3 + DynamoDB for Terraform backend

## 🧩 Prerequisites
Ensure AWS CLI, Terraform, Ansible, and Jenkins are installed.
```bash
aws configure
```
Default region: `us-east-1`

## 🏗️ Step 1: Setup Terraform Backend
```bash
cd terraform/backend
terraform init
terraform apply -auto-approve
```

## 🏗️ Step 2: Deploy Infrastructure
```bash
cd ../
terraform init -reconfigure
terraform apply -auto-approve
```

## ⚙️ Step 3: Configure Instances (Ansible)
Edit inventory:
```ini
[jenkins]
jenkins-999 ansible_host=<JENKINS_PUBLIC_IP> ansible_user=ec2-user

[app]
app-999 ansible_host=<APP_PRIVATE_IP> ansible_user=ec2-user

[bastion]
bastion-999 ansible_host=<BASTION_PUBLIC_IP> ansible_user=ec2-user
```
Run:
```bash
ansible-playbook -i ansible/inventory ansible/install_docker.yml
```

## 🚀 Step 4: Jenkins Pipeline
1. Connect GitHub repo in Jenkins
2. Use `/jenkins/Jenkinsfile`
3. Configure AWS credentials
4. Run the pipeline

Stages:
- Checkout
- Build Docker image
- Push to ECR
- Deploy via Ansible

## 🧪 Step 5: Verify Deployment
Visit ALB DNS → should display:
```
Hello from Node.js app on AWS!
```

## 🧹 Step 6: Cleanup
```bash
terraform destroy -auto-approve
```

## 📁 Structure
```
aws-vpc-devops-ninja-999/
terraform-infra-project1-aws-devops-/
ansible-config-project1-aws-devops/
nodejs-app-project1-aws-devops- jenkins/
app/
docs/
```



