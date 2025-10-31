# AWS DevOps POC - Project 999

## Steps
1. Initialize backend (`terraform/backend`): `terraform apply`
2. Configure backend in main Terraform and run `terraform init -reconfigure`
3. Deploy VPC, subnets, EC2, ALB: `terraform apply`
4. Use Ansible to install Docker: `ansible-playbook -i ansible/inventory ansible/install_docker.yml`
5. Set up Jenkins on Jenkins EC2, connect GitHub repo.
6. Run pipeline to build and deploy Node app to ECR and App instance.
