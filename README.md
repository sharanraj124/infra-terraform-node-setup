# 🌐 Infra Interview Task — Node.js App Deployment with Terraform

This project demonstrates an automated infrastructure deployment of a simple Node.js "Hello World" application to AWS using **Terraform** and **GitHub Actions**.

## 🚀 Project Overview

- ⚙️ **Infrastructure as Code**: Terraform
- ☁️ **Cloud Provider**: AWS
- 🐳 **Application**: Dockerized Node.js app
- 🚢 **CI/CD**: GitHub Actions
- 🌍 **Deployment Target**: EC2 instance
- 📊 **Monitoring**: Integrated with Datadog (agent installed on EC2)
---

## 📁 Project Structure

```bash
.
├── app/                          # Node.js Hello World application
│   ├── Dockerfile                # Dockerfile to containerize the app
│   └── index.js                  # Entry point of the Node.js app
│
├── terraform/                    # Terraform IaC configuration
│   ├── main.tf                   # Main infra file using modules like EC2, VPC, etc.
│   ├── variables.tf              # Input variables for infrastructure
│   ├── outputs.tf                # Output values after apply
│   └── create-s3-state/          # Module to create S3 + DynamoDB backend
│       └── main.tf               # Creates S3 bucket & DynamoDB for remote backend
│
├── .github/
│   └── workflows/
│       └── deploy.yml            # GitHub Actions CI/CD workflow
│
├── .gitignore                    # Git ignored files config
├── README.md                     # Project documentation

```


---

## ⚙️ How It Works

1. **Node.js app** is containerized using Docker.
2. **Terraform** provisions AWS resources (e.g., EC2, Security Groups).
3. **GitHub Actions** automates:
   - Terraform plan & apply
   - Optional Docker build & deployment
4. Your app is accessible via public IP/DNS after deployment.

---

## 🧰 Prerequisites

- AWS Account with proper IAM credentials
- GitHub repository with:
  - `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `DOCKER_USERNAME`  and `DOCKER_PASSWORD` stored in **GitHub Secrets**
---

## 🔐 GitHub Secret

| Key                 | Description                          |
|---------------------|--------------------------------------|
| `AWS_ACCESS_KEY_ID` | Your AWS access key                  |
| `AWS_SECRET_ACCESS_KEY` | Your AWS secret key           |
| `DOCKER_USERNAME` | Your Docker registry username   |
| `DOCKER_USERNAME` | Your Docker registry password   |

---

## Local deployment application

### Requirements

- Node.js version - v20.19.0

### Installation

```bash
 cd app
 npm install
```

### Run Application

```bash
# Option1 - core nodejs

npm run start

# Option2 - docker compose

docker-compose up -d
```

### Access application

```bash
	http://localhost:3000 # returns 'hello world' message
```

---

### Terraform 

1. Create s3 and dynomodb table [Only once - for state locking]

```bash
cd terraform/create-s3-state
terraform init
terraform plan
terraform apply
```

2. Create ec2 instance and deploy the image using docker registry

```bash
cd terraform/
terraform init
terraform plan
terraform apply
```
