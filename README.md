# 🚀 DevOps & Cloud Security Engineer — Assessment Project

A **complete, production-ready DevSecOps implementation** demonstrating end-to-end capabilities in:
- 🧠 Cloud architecture (AWS + Terraform + EKS)
- ⚙️ CI/CD automation (GitHub Actions, Helm, Docker)
- 🛡️ Security hardening (IRSA, TLS, Trivy, RBAC, NetworkPolicies)
- 🧩 Real-world scenario thinking (incident response, zero-trust, supply chain)
- 💬 Strong documentation and risk-based decision making

This repository showcases **practical, secure, and automated cloud delivery** as expected from experienced DevOps & Cloud Security Engineers.


## 🧱 Section 1 — Hands-On Implementation

### A. Node.js Service
- Endpoints:
  - `GET /healthz` → `{ status: "ok", commit: <sha> }`
  - `GET /api/v1/todos` → list todos
  - `POST /api/v1/todos` → create `{ id, title, done }`
- **Features:**
  - Jest + Supertest tests (health, happy path, negative case)
  - Prometheus metrics endpoint
  - JSON structured logs via Pino
  - Multi-stage Dockerfile (non-root, minimal image)

### B. CI/CD Pipeline
- **Stages:**
  1. Build & Unit Tests → `npm ci && npm test`
  2. Static Analysis → ESLint (fail on error)
  3. Dependency Scan → `npm audit --audit-level=high`
  4. Image Build & Scan → Trivy (fail on High/Critical)
  5. Deploy → Helm to EKS (rolling/blue-green)
  6. Provenance → Inject Git SHA in `/healthz`
- **Artifacts:** `.github/workflows/ci-cd.yaml`, Trivy report, provenance file

### C. Cloud & Security Hardening
- **Infrastructure (Terraform):**
  - VPC: 2 public + 2 private subnets
  - EKS cluster with IRSA + secure node groups
  - Secure Terraform state (S3 SSE-KMS + DynamoDB lock)
  - Secrets in AWS Secrets Manager / SSM
- **Kubernetes Hardening:**
  - Probes + limits + non-root containers
  - NetworkPolicy deny-all + allow-from-ingress
  - ALB ingress with ACM TLS

---

## 🧩 Section 2 — Scenario Questions (Short Answers)

| # | Scenario | Summary |
|---|-----------|----------|
| 1 | Incident Response | Isolate pods via NetworkPolicies, capture logs (CloudTrail, VPC Flow), enable GuardDuty, restore from clean images. |
| 2 | Secrets | Reject `.env` file, migrate to Secrets Manager/SSM, use IRSA for access, enforce rotation. |
| 3 | Zero-Trust in K8s | Apply IRSA (identity), RBAC (policy), NetworkPolicy (segmentation), and mTLS (encryption). |
| 4 | Supply Chain | Use pinned base images, SBOM (Syft), Trivy scans, and Git SHA provenance. |
| 5 | Cost vs Security | Keep scans; use severity gates, async scans, and allowlists for balance. |

---

## 🧠 Section 3 — Short Form Questions

| # | Topic | Key Takeaway |
|---|--------|--------------|
| 1 | AWS SG vs NACL | SG = Stateful, instance-level; NACL = Stateless, subnet-level |
| 2 | Terraform State | Secure via S3 (SSE-KMS) + DynamoDB lock |
| 3 | Image Scanning | Trivy and Grype |
| 4 | K8s RBAC | Role + RoleBinding for ConfigMap access |
| 5 | IRSA | Pod-level IAM roles; least-privilege, auditable |

---

## 🎁 Bonus Implementations

- Helm environment values: dev/stage/prod  
- Kyverno admission policy for non-root + limits  
- SBOM via Syft + CI attestation  
- OWASP ZAP baseline scan  
- Blue/Green deployments via ALB or Argo Rollouts  

---

## 🧮 Architecture Diagram



## 🔐 Threat Model Summary

| Threat | Control | Mitigation |
|--------|----------|-------------|
| Secret Exposure | AWS Secrets Manager | No plaintext secrets |
| Image Vulnerabilities | Trivy / Grype | Prevents CVEs in builds |
| IAM Misuse | IRSA | Pod-level scoped roles |
| Privilege Escalation | Non-root + readOnly | Container breakout prevention |
| Network Intrusion | NACL + NetworkPolicy | Traffic isolation |
| MITM | ACM TLS | Encrypted data in transit |
| Supply Chain Tampering | Provenance + SHA tags | Build integrity |

---

## 🔄 Future Improvements
- Add OPA Gatekeeper for policy enforcement  
- Integrate Cosign for image signing  
- Add Terraform Cloud backend  
- Nightly OWASP ZAP DAST scans  

---

## 🏁 Outcome

> A **secure, automated DevSecOps pipeline** covering code → cloud → compliance.  
> Built to mirror **enterprise-grade AWS DevOps practices**, showcasing strong technical execution, automation, and security design.

---

## 🏷️ Tags
```
devsecops  aws  terraform  eks  helm  docker  nodejs  
kubernetes  github-actions  ci-cd  trivy  dynamodb  
security  irsa  networkpolicy  s3  kms  cloud-engineering
```
