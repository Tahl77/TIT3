# Multi-Tier Architecture on AWS using Terraform

Deploy a scalable and resilient multi-tier architecture on AWS using Terraform.

## 🚀 Project Overview

This project allows us to deploy a highly available, scalable, and secure multi-tier architecture on Amazon Web Services (AWS) using Terraform. The architecture consists of the following three tiers:

- **Web Tier**: This tier handles incoming user requests and can be horizontally scaled for increased capacity. It typically includes web servers and a load balancer for distributing traffic.

- **Application Tier**: Application servers run our business logic and interact with the database tier. They can also be horizontally scaled to meet demand.

- **Database Tier**: The database stores and manages our application data. In this architecture, we use Amazon RDS for a managed database service.

## 🚦 Getting Started
![alt text](image.png)

### Prerequisites
(first time using AWS :)

Before you get started, make sure you have the following prerequisites in place:

- [Terraform](https://www.terraform.io/) installed.
- AWS IAM credentials configured.(key-pair(mine:tit-dev-machine-key))
- Git for cloning the repository.

## 📋 Table of Contents

- [Features](#-features)
- [Web Tier](#-web-tier)
- [Application Tier](#-application-tier)
- [Database Tier](#-database-tier)
- [Terraform Configuration](#-terraform-configuration)
- [Deployment](#-deployment)
- [Usage](#-usage)
- [Contributing](#-contributing)
- [License](#-license)

## ✨ Features

- **High Availability**: The architecture is designed for fault tolerance and redundancy.
- **Scalability**: Easily scale the web and application tiers to handle varying workloads.
- **Security**: Security groups and network ACLs are configured to ensure a secure environment.

## Backend S3 bucket

S3 bucket for secure and stable statefile.
Open bootstrap folder and run tf init and apply.
once thats done get the name of the s3 bucket and use it the backend of main project for s3 bucket's name.

## 🌟 Web Tier

The Web Tier is the entry point for incoming user requests. It typically includes:

- **Load Balancer**: Distributes traffic across multiple web servers.
- **Auto Scaling**: Automatically adjusts the number of web servers based on traffic.
- **Security Groups**: Controls incoming and outgoing traffic to the web servers.

### Web Tier Configuration

- [Launch Template Configuration](launch-template-web.tf)
- [Load Balancer Configuration](alb-web.tf)
- [Auto Scaling Configuration](asg-web.tf)
- [Security Group Configuration of Load balancer](alb-web-sg.tf)
- [Security Group Configuration of Auto Scaling Group](asg-web-sg.tf)

## 🚀 Application Tier

The Application Tier hosts the application servers responsible for running business logic and interacting with the database tier. Key components include:

- **Application Servers**: These run your application code and can be horizontally scaled.
- **Load Balancer**: Distributes traffic to the application servers.
- **Auto Scaling**: Automatically adjusts the number of web servers based on traffic.
- **Security Groups**: Controls incoming and outgoing traffic to the application servers.

### Application Tier Configuration

- [Launch Template Configuration](launch-template-app.tf)
- [Load Balancer Configuration](alb-app.tf)
- [Auto Scaling Configuration](asg-app.tf)
- [Security Group Configuration of Load balancer](alb-app-sg.tf)
- [Security Group Configuration of Auto Scaling Group](asg-app-sg.tf)

## 💽 Database Tier

The Database Tier stores and manages our application data. We use Amazon RDS for a managed database service. Key components include:

- **Amazon RDS**: A managed database service for MySQL/PostgreSQL/SQL Server databases.
monitor creating(it takes 10+min)
aws rds describe-db-instances --db-instance-identifier three-tier-demo-db --query 'DBInstances[0].DBInstanceStatus'

- **Security Groups**: Control incoming and outgoing traffic to the database.

### Database Tier Configuration

- [DB Subnet group Configuration](db-subnet-group.tf)
- [Amazon RDS Configuration](rds.tf)
- [Security Group Configuration](db-sg.tf)

## 🔧 Terraform Configuration

The Terraform configuration for this project is organized into different and resources to create the necessary AWS infrastructure components. Key resources include:

- Virtual Private Cloud (VPC)
- Subnets and Route Tables
- Security Groups and Network ACLs
- Load Balancers
- Auto Scaling Groups
- RDS Database Instances

## 🚀 Deployment

Follow these steps to deploy the architecture:

1. Clone the repository:

   ```bash
   git clone https://github.com/Tahl77/TIT3.git
   ```

2. Go to folder boostrap to setup the backend:
   ```
   cd bootstrap
   terrform init
   terrform apply
   
   Outputs:

   s3_bucket_name = "tit-terraform-state"
   s3_bucket_region = "eu-north-1"
   ```
   Output will show the name of the bucket which would be used in main.tf
   Ideally this is separate task/pipeline in its own folder or repo.

3. Initialize Terraform in main folder(TIT3) and apply the configuration:
   ```
   terraform init
   terraform apply -var-file="secret.tfvars" -auto-approve
   ```
   Skipping the plan -outplan for when its actually needed(debugging -.-`)
   we use the var file for the database creds or we wont be able to create it unless we input them by hand

4. Terraform will create:

- VPC/subnets/security groups

- ASGs for web and app tiers

- Launch templates / EC2 instances

- RDS database

- Load balancers and target groups

- CloudWatch alarms and dashboards

Terraform waits for RDS and ASG instances to be fully available (~10–15 minutes).

5. Test the Deployment

Web and App Servers

Check the Load Balancer DNS in the AWS console.

Access the web tier via browser — it should route through the ALB.

CloudWatch Alarms / Dashboards

Go to CloudWatch → Dashboards → Your dashboard name.

Trigger a high CPU test: SSH into an EC2 and run a CPU load generator, or temporarily set alarm thresholds low for demo.

RDS Database

Use the credentials from secret.tfvars to connect:
```
mysql -h <rds-endpoint> -u dbmaster -p
```

Extra: [Pause](\pause_resources\pause_rds.sh) functionallity to lower costs(even if free it still drains the credits)

## 💼 Usage

### Scaling
- To scale the Web or Application Tier, use Auto Scaling configurations provided in the respective Terraform files. Adjust the desired capacity to match your scaling requirements.
### Database Management
- Access the Amazon RDS instance in the Database Tier to manage your data.
### Load Balancing
- Configure the load balancer in the Web and Application Tiers to distribute traffic evenly.
### Security Considerations
- Review and customize the security groups and network ACLs to meet your specific security requirements.

## 🤝 Contributing
Contributions are Welcome! Please read my Contributing Guidelines to get started with contributing to this project.

## 📄 License
This project is licensed under the MIT License.

Next Steps:

Add better S3 bucket (have examples).

Add more monitoring (grafana prometheus/elk).

Add jumphost so we dont have direct access.


