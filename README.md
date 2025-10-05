🚀 todos-service-assessment — DevSecOps & Cloud Security Engineer Project

A production-grade DevSecOps implementation designed to demonstrate secure, automated delivery pipelines on AWS, leveraging Terraform, EKS, Helm, Docker, and GitHub Actions.
This project mirrors real-world enterprise cloud engineering practices, emphasising security, automation, observability, and scalability.

🧩 Key Highlights

⚙️ End-to-End CI/CD Pipeline: Automated build, test, security scan, and deployment using GitHub Actions

☁️ Infrastructure as Code (IaC): AWS infrastructure provisioned with Terraform (VPC, EKS, DynamoDB, Secrets Manager)

🛡️ Security by Design: IRSA, RBAC, TLS via ACM, network isolation, and non-root containers

📊 Observability: Centralised CloudWatch logs, Prometheus metrics, and health endpoints for proactive monitoring

🧠 Supply Chain Security: Integrated Trivy image scanning, provenance recording, and SBOM generation

🚨 Incident Response & Compliance: Documented response procedures and security control implementations

🧱 Architecture Overview
Commit-to-Deployment Flow
graph TD
  Dev[Developer Commit] --> CI[GitHub Actions Pipeline]
  CI --> Build[Build + Test + Lint + Audit]
  Build --> Scan[Trivy Image Scan & Provenance Record]
  Scan --> Deploy[Helm Deploy to AWS EKS]
  Deploy --> ALB[ALB with ACM TLS]
  ALB --> Pods[Todos Pods (IRSA + Non-root)]
  Pods --> DynamoDB[(DynamoDB Table)]
  CloudWatch[(Logs & Metrics)] --> Monitoring[Prometheus / Grafana]

🧮 Tech Stack
Category	Tools / Technologies
Cloud Provider	AWS (EKS, DynamoDB, Secrets Manager, ALB, CloudWatch)
Infrastructure as Code	Terraform (Modular Design, Remote State, IAM Roles)
CI/CD	GitHub Actions (Build → Scan → Deploy)
Containerisation	Docker (Multi-stage, Non-root, Lightweight)
Orchestration	Kubernetes + Helm Charts
Security	Trivy, IRSA, RBAC, TLS (ACM), NetworkPolicies
Monitoring	Prometheus, Grafana, CloudWatch
Programming	Node.js (Express, Jest, Supertest, Pino)
🧰 How to Run
Local Development
git clone https://github.com/prince411014/todos-service-assessment.git
cd todos-service-assessment
npm ci && npm start

Run Tests
npm test

📘 Documentation
Section	Description
[docs/architecture.md]	Detailed architecture and infrastructure design
[SECTION_2_SCENARIOS.md]	Security and incident response scenarios
[SECTION_3_QA.md]	Short-form technical Q&A
[SECURITY_CONTROLS.md]	Implemented security controls
[docs/security-scan-report.txt]	Sample Trivy vulnerability scan report
🔒 Security & Compliance Summary
Category	Implementation
Secrets Management	AWS Secrets Manager & IRSA
Container Security	Trivy image scanning (blocks High/Critical CVEs)
IAM & Roles	Least-privilege access + IRSA integration
Network Security	Private subnets + Kubernetes NetworkPolicies
Pod Security	Non-root user, read-only root FS, dropped NET_RAW
Transport Security	TLS with AWS ACM certificates
Logging & Monitoring	Structured JSON logs via Pino → CloudWatch; Prometheus metrics
🧠 Assessment Coverage
Section	Description
1. Hands-On Implementation	Node.js REST API + Terraform + Helm + CI/CD
2. Scenario-Based Q&A	Incident response, secrets rotation, zero-trust, supply chain
3. Short Technical Q&A	IRSA, Terraform state recovery, RBAC, network security
Bonus	SBOM, Kyverno policies, ZAP scanning, Blue/Green deployments
👨‍💻 Author — Prince Kumar

Cloud & DevSecOps Engineer | AWS & Azure | Terraform | Kubernetes | CI/CD | Security Automation

🔗 LinkedIn

💬 Passionate about Cloud Engineering, Automation, and Building Secure, Scalable Systems

🏁 Outcome

A fully automated DevSecOps pipeline and infrastructure demonstrating secure delivery, observability, and compliance — built to reflect enterprise-grade DevOps and Cloud Security engineering excellence.
