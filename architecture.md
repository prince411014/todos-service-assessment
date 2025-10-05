# 🏗️ Architecture Overview

This document outlines the system design of the **todos-service-assessment** project.

graph TD
  Dev[Developer Commit] --> CI[GitHub Actions Pipeline]
  CI --> Build[Build + Test + Lint + Security Audit]
  Build --> Scan[Trivy Image Scan + Provenance Verification]
  Scan --> Deploy[Helm Deployment to AWS EKS]
  Deploy --> ALB[Application Load Balancer (ACM TLS Enabled)]
  ALB --> Pods[Todos Service Pods (IRSA + Non-root User)]
  Pods --> DynamoDB[(AWS DynamoDB Table)]
  CloudWatch[(Centralised Logs & Metrics)] --> Monitoring[Prometheus / Grafana Dashboards]


### Components Explained
- **CI/CD:** GitHub Actions automates build, lint, testing, scanning, and deployment.
- **EKS:** Runs the Node.js REST API securely with IRSA and resource limits.
- **Terraform:** Manages VPC, EKS, IAM, and DynamoDB infrastructure.
- **Observability:** Logs to CloudWatch, metrics exposed for Prometheus scraping.
- **Security:** TLS via ACM, non-root pods, restricted NetworkPolicies.
