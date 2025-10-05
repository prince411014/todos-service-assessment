# Todos Service – A Secure Cloud-Native Microservice

**Author:** Prince Kumar — Cloud & DevOps Engineer (AWS | Azure | Terraform | Kubernetes)

This project is part of my DevOps and Cloud Security practice, where I built a production-ready microservice using **Node.js**, **Express**, and **AWS DynamoDB**.  
It demonstrates how I apply **Infrastructure as Code (Terraform)**, **container orchestration (Kubernetes on AWS EKS)**, and **security best practices** in real deployments.

---

## 🔍 Quick Overview

- REST API to create and list todos  
- Health check endpoint: `/healthz`  
- Prometheus metrics: `/metrics`  
- Logging: JSON-based (Pino)  
- Infrastructure: Terraform + AWS EKS + IRSA + DynamoDB  
- Deployment: Helm + Kubernetes manifests  
- Security: IAM least privilege, KMS encryption, Trivy scans

---

## 📊 Architecture Diagram

![Todos Service Architecture]

The diagram above illustrates the complete DevOps workflow — from code commit to deployment.  
It showcases the integration of **CI/CD pipelines**, **Terraform-based infrastructure**, and **Helm deployments** on **AWS EKS**.  
The service securely interacts with **AWS DynamoDB** using **IRSA and IAM policies**, while **Trivy** ensures image security and **Prometheus** enables observability.

---

## ⚙️ How to Deploy

You can deploy this project in your environment using the steps below:

```bash
# Clone the repository
git clone https://github.com/prince411014/todos-service-assessment.git
cd todos-service-assessment

# Deploy infrastructure
terraform init
terraform apply

# Deploy the application
helm install todos ./helm
```

This demonstrates an end-to-end DevOps workflow using Terraform and Helm.

---

## 🔁 CI/CD Workflow

This project supports a complete CI/CD pipeline automating build, test, and deployment stages.

**Workflow Steps:**
1. Linting & Unit Testing – Ensures code quality.  
2. Docker Build & Push – Builds and pushes container image to ECR.  
3. Terraform Plan & Apply – Provisions AWS infrastructure.  
4. Helm Deploy – Deploys the application to EKS.  
5. Security Scans – Uses Trivy for image vulnerability checks.

These stages can be implemented with **Jenkins**, **GitHub Actions**, or **Azure DevOps**.

---

## 🧠 Key Features

- **Infrastructure as Code:** Managed via Terraform  
- **Secure Access:** IAM + IRSA for fine-grained permissions  
- **Automation:** Helm for Kubernetes deployment  
- **Observability:** Health checks and Prometheus metrics  
- **Security:** KMS encryption + Trivy image scans  

---

## 💬 Final Note

I built this project to challenge myself to design, automate, and secure a complete cloud-native microservice from scratch.  
It reflects my mindset as a DevOps engineer — **practical, security-focused, and always learning**.

---

📂 **Repository:** [https://github.com/prince411014/todos-service-assessment](https://github.com/prince411014/todos-service-assessment)  
👨‍💻 **Author:** Prince Kumar  
📧 **Contact:** prince.kumar22@outlook.com  
📍 **Location:** Pune, India
