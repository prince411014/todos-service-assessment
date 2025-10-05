# 🏗️ Architecture Overview

This document outlines the system design of the **todos-service-assessment** project.

```mermaid
graph TD
  Dev[Developer Commit] --> CI[GitHub Actions]
  CI --> Build[Build + Lint + Test + Scan]
  Build --> Deploy[Helm Deploy to AWS EKS]
  Deploy --> ALB[ALB + ACM TLS]
  ALB --> Pods[App Pods (IRSA)]
  Pods --> DynamoDB[(DynamoDB Table)]
  Logs[CloudWatch Logs] --> Monitor[Prometheus / Grafana]
```

### Components Explained
- **CI/CD:** GitHub Actions automates build, lint, testing, scanning, and deployment.
- **EKS:** Runs the Node.js REST API securely with IRSA and resource limits.
- **Terraform:** Manages VPC, EKS, IAM, and DynamoDB infrastructure.
- **Observability:** Logs to CloudWatch, metrics exposed for Prometheus scraping.
- **Security:** TLS via ACM, non-root pods, restricted NetworkPolicies.
