# 🚀 todos-service-assessment — DevOps & Cloud Security Engineer Project

A **production-grade DevSecOps project** built for the *DevOps & Cloud Security Engineer Assessment*, demonstrating secure, automated delivery on **AWS** using **Terraform, EKS, Helm, Docker, and GitHub Actions**.

---

## 🧩 Overview
This repository showcases:
- ✅ Secure **Node.js REST API** (`/healthz`, `/api/v1/todos`) with structured logs and metrics
- 🧠 **CI/CD Pipeline** — build, test, scan, deploy with provenance
- ☁️ **Terraform Infrastructure** — VPC, EKS, DynamoDB, Secrets Manager
- 🛡️ **Security Hardening** — IRSA, RBAC, TLS, NetworkPolicies, non-root containers
- 📈 **Observability** — Prometheus metrics, CloudWatch logs

---

## 🧱 Architecture Diagram
Below is the end-to-end system flow from commit to deployment.

```mermaid
graph TD
  Dev[Developer Commit] --> CI[GitHub Actions Pipeline]
  CI --> Build[Build + Test + ESLint + Audit]
  Build --> Scan[Trivy Image Scan + Provenance Record]
  Scan --> Deploy[Helm Deploy to AWS EKS]
  Deploy --> ALB[ALB + ACM TLS]
  ALB --> Pods[Todos Pods (IRSA + Non-root)]
  Pods --> DynamoDB[(DynamoDB Table)]
  CloudWatch[(Logs + Metrics)] --> Monitoring[Prometheus/Grafana]
```

---

## ⚙️ Getting Started

### Run locally
```bash
git clone https://github.com/prince411014/todos-service-assessment.git
cd todos-service-assessment
npm ci && npm start
```


### Run tests
```bash
npm test
```

### Build Docker image
```bash
docker build -t todos-service .
docker run -p 3000:3000 todos-service
```

---

## 🧰 Documentation
| Section | Description |
|----------|--------------|
| [docs/architecture.md] | Detailed architecture and EKS flow |
| [SECTION_2_SCENARIOS.md] | Scenario-based security responses |
| [SECTION_3_QA.md] | Short-form technical Q&A |
| [SECURITY_CONTROLS.md] | Documented security measures |
| [docs/security-scan-report.txt] | Sample Trivy scan results |

---

## 🧮 Security & Compliance Summary

| Category | Implementation |
|-----------|----------------|
| Secrets | AWS Secrets Manager & IRSA |
| Image Security | Trivy scan (fail on High/Critical CVEs) |
| IAM & Identity | IRSA + least-privilege IAM |
| TLS | ACM-managed certificates |
| Pod Security | Non-root user, readOnlyRootFS, drop NET_RAW |
| Network | Private subnets + NetworkPolicies |
| Logging | JSON logs to CloudWatch |

---

## 🧠 Assessment Coverage

| Section | Description |
|----------|--------------|
| **1. Hands-On** | Node.js REST API + CI/CD + Terraform IaC |
| **2. Scenarios** | Incident response, secrets, zero-trust, supply chain, cost vs security |
| **3. Short Form** | AWS SG vs NACL, IRSA, Terraform state, RBAC, scanners |
| **Bonus** | Helm envs, Kyverno policy, SBOM, ZAP scan, Blue/Green deploys |

---

## 👤 Author
**Prince Kumar**  
🔗 [LinkedIn Profile](https://www.linkedin.com/in/prince-kumar-9084a3145)  
💬 Passionate about **Cloud | DevSecOps | Automation | Security-First Engineering**

---

### 🏁 Outcome
> A complete **DevSecOps implementation** with automation, observability, and security-by-design — built to reflect enterprise-grade cloud engineering standards.
