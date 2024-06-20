# assignment

Task 1 : Advanced Infrastructure as Code (IaC) with Terraform

Create 4 Different Reusable Terraform Modules

- VPC
- SG
- EC2
- RDS

Utilzed the Modules to create Production Environment

- It consists of 1 VPC with 2 private and 2 public subnet respectively along with Internet Gateway and Nat Gateway.
- Created private nad public route tables and associated them with respective subnets.
- Created 2 security groups for RDS and EC2 Instances.
- Created 1 Ec2 insance and 1 RDS Instance as well in each privta subnet
- Have used Providers.tf to specify AWS Provider.
- VPC is spread across 2 Avaialability Zones

Structure Followed
terraform
├───environment
│ └───production
│ main.tf
│ output.tf
│ provider.tf
└───modules
├───ec2
│ main.tf
│ output.tf
│ variables.tf
├───rds
│ main.tf
│ output.tf
│ variables.tf
├───sg
│ main.tf
│ output.tf
│ variables.tf
└───vpc
main.tf
output.tf
variables.tf

We can create backend.tf file as well and store the remote state in S3 bucket ans use DynamoDb to create a lock on erraform state 

Task 2: Kubernetes Deployment

- Created Simple helm chart using helm create nginx-application
- To implement High Availablity have implemented horizontal pod autoscaler which scales the deployment based on CPU/Memory Utilisation.
- Have implemented based on CPU Utilisation.
- Inorder to implement HPA we need to configure metrics-server in order to collect utilisation
  metrics.
- Implemented rolling update startegy for the application using strategy type RollingUpdate.

Structure Followed
├───kubernetes
│ └───nginx-application
│ │ .helmignore
│ │ Chart.yaml
│ │ values.yaml
│ └───templates
│ │ deployment.yaml
│ │ hpa.yaml
│ │ ingress.yaml
│ │ NOTES.txt
│ │ service.yaml
│ │ serviceaccount.yaml
│ │ \_helpers.tpl  
│ └───tests
│ test-connection.yaml

- To Configure the application for high availability across multiple nodes.We can configure nodeselectors and affinity in the deployment tp spread applications pods across multiple nodes based on the requirements


Task 3: CI/CD with GitHub Actions or Similar
To create a CI/CD Pipeline have created a simple HELLO World Python application . Also have created a Dockerfile o containerize the application 
In order to create CI/CD Pipeline , in .github/workflow folder have added
  - build.yaml --> This pipeline is to build the docker image for the applicaion for any push done to the repo
  - deploy.yaml --> his pipine is to deploy the docker image to saging/production environment , if the changs are pushed to main branch the code is deployed on production environment where as if done to staging then to the staging environment
