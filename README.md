# Todos Service — A Secure Cloud-Native Microservice
**Author:** Prince Kumar — Cloud & DevOps Engineer (AWS | Azure | Terraform | Kubernetes)

This project is part of my DevOps and Cloud Security practice, where I built a production-ready microservice using Node.js, Express, and AWS DynamoDB.  
It demonstrates how I apply Infrastructure as Code (Terraform), container orchestration (Kubernetes on AWS EKS), and security best practices in real deployments.

## 🔍 Quick Overview
- REST API to create and list todos  
- Health check endpoint: `/healthz`  
- Prometheus metrics: `/metrics`  
- Logging: JSON-based (Pino)  
- Infrastructure: Terraform + AWS EKS + IRSA + DynamoDB  
- Deployment: Helm + Kubernetes manifests  
- Security: IAM least privilege, KMS encryption, Trivy scans

## 📊 Architecture Diagram
![Todos Service Architecture](https://github.com/prince411014/todos-service-assessment/blob/main/Todos%20Service%20Architecture%20Flowchart.png)

The diagram shows how the app interacts with AWS resources and integrates with the CI/CD pipeline.

---

## ⚙️ How to Deploy

You can easily deploy this project in your own environment by following these steps:

```bash
# Clone the repository
git clone <repo-url>
cd todos_service

# Deploy infrastructure
terraform init
terraform apply

# Deploy the application
helm install todos ./helm
```

This setup demonstrates an end-to-end deployment workflow using Terraform and Helm, similar to real-world DevOps projects.

---

## 🔁 CI/CD Workflow

This project supports a complete CI/CD pipeline that automates build, test, and deployment stages.

Typical workflow includes:

1. **Linting & Unit Testing** — Code quality and logic validation.  
2. **Docker Build & Push** — Containerize the app and push to ECR.  
3. **Terraform Plan & Apply** — Provision and configure infrastructure.  
4. **Helm Deploy** — Deploy the latest build to EKS.  
5. **Security Scans** — Automated Trivy scans for vulnerabilities.  

These steps can be implemented in Jenkins, GitHub Actions, or Azure DevOps to maintain automation, consistency, and quality across environments.

---

## 📦 Sample API Output

### ➕ Create Todo (`POST /todos`)
**Request:**
```json
{
  "title": "Finish Terraform setup",
  "status": "pending"
}
```

**Response:**
```json
{
  "id": "12345",
  "title": "Finish Terraform setup",
  "status": "pending",
  "createdAt": "2025-10-05T12:34:56Z"
}
```

### 📄 List Todos (`GET /todos`)
**Response:**
```json
[
  {
    "id": "12345",
    "title": "Finish Terraform setup",
    "status": "pending"
  },
  {
    "id": "12346",
    "title": "Deploy Helm chart",
    "status": "completed"
  }
]
```

---

## 💬 Final Note

I built this project to challenge myself to design, automate, and secure a complete cloud-native microservice from scratch.  
From provisioning infrastructure with Terraform to deploying on Kubernetes (EKS) and securing resources with IAM and KMS, every component reflects how I approach real-world DevOps and cloud-security practices.  
Through this hands-on experience, I’ve deepened my understanding of reliability, scalability, and automation in production environments.  
It represents my mindset as a DevOps engineer — practical, security-focused, and always learning — and I’m excited to bring the same energy and expertise to future projects and teams.
