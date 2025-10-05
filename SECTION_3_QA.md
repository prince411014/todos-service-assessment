# ✅ SECTION_3_QA.md
## Section 3 — Short Form Questions & Bonus

---

### 1. AWS Security Group vs NACL Differences

| Feature | Security Group (SG) | Network ACL (NACL) |
|----------|---------------------|--------------------|
| **Scope** | Instance/pod level (ENI) | Subnet level |
| **Statefulness** | Stateful | Stateless |
| **Rule Evaluation** | Allow rules only, evaluated together | Allow & Deny, evaluated in order |
| **Use Case** | Instance/pod-level control | Subnet-level filtering |

**Best Practice:** Use NACLs for baseline subnet security and SGs for instance-level access control.

---

### 2. Purpose of Terraform State & Two Ways to Secure It

**Purpose:** Maintains a mapping of infrastructure resources for safe updates and drift detection.

**Secure Methods:**
1. **S3 backend with SSE-KMS encryption.**
2. **DynamoDB state locking** to prevent concurrent applies.

(Bonus: restrict S3 access via IAM and enable versioning + MFA delete.)

---

### 3. Two Tools for Container Image Scanning

| Tool | Description |
|------|--------------|
| **Trivy** | Scans containers, IaC, and dependencies for CVEs (used in CI). |
| **Grype** | SBOM-based vulnerability scanner by Anchore. |

**Pipeline Integration:** Trivy enforces High/Critical fail gate in CI/CD.

---

### 4. Kubernetes RBAC — Grant Pod-Level Access to a ConfigMap

```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: configmap-reader
  namespace: app-namespace
rules:
  - apiGroups: [""]
    resources: ["configmaps"]
    verbs: ["get", "list"]
---
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: configmap-reader-binding
  namespace: app-namespace
subjects:
  - kind: ServiceAccount
    name: app-sa
roleRef:
  kind: Role
  name: configmap-reader
  apiGroup: rbac.authorization.k8s.io
```
Grants least-privilege access to ConfigMaps for pods using the `app-sa` service account.

---

### 5. Explain IRSA and Why It’s Safer Than Node Roles

**IRSA (IAM Roles for Service Accounts):**
Lets pods assume IAM roles via OIDC instead of node instance profiles.

**Advantages:**
- **Least privilege:** Each pod gets dedicated, scoped permissions.
- **No credential sharing:** Tokens are short-lived and pod-specific.
- **Audit-ready:** Actions traceable to individual pods.

---

## ⭐ Bonus Differentiators

### 1. Helm Environments
Separate values for `dev`, `stage`, `prod` controlling replica counts, limits, image tags.

### 2. Admission Controls (Kyverno)
```yaml
apiVersion: kyverno.io/v1
kind: ClusterPolicy
metadata:
  name: enforce-nonroot-limits
spec:
  validationFailureAction: enforce
  rules:
    - name: require-nonroot-and-limits
      match:
        resources:
          kinds: ["Pod"]
      validate:
        message: "Pods must run as non-root and define limits."
        pattern:
          spec:
            containers:
              - securityContext:
                  runAsNonRoot: true
                resources:
                  limits:
                    cpu: "?*"
                    memory: "?*"
```

### 3. SBOM + Attestation
Generated via Syft and stored as artifact:
```bash
syft dir:. -o json > sbom.json
```

### 4. OWASP ZAP Baseline Scan
Automated scan against dev endpoint with `zap-baseline.py -t http://dev.todos-service`.

### 5. Blue/Green or Weighted Deployments
Supports ALB target group weights or Argo Rollouts for zero-downtime upgrades.

---

## 📦 What to Submit

**Repository:**
```
src/           → Node.js app & tests
terraform/     → VPC, EKS, IRSA, DynamoDB
helm/ or k8s/  → Deployment, Service, Ingress, NetworkPolicy
.github/       → CI/CD workflow
README.md      → Setup, Architecture, Security, Trade-offs
```

---

### Architecture (Mermaid)
```mermaid
graph TD
  Dev[Developer Commit] --> CI[GitHub Actions]
  CI --> Scan[Trivy + ESLint + npm audit]
  Scan --> EKSDeploy[Helm to EKS]
  EKSDeploy --> ALB[ALB + ACM TLS]
  ALB --> Pods[Todos Pods (IRSA)]
  Pods --> DynamoDB[(DynamoDB Table)]
  CloudWatch[(Logs & Metrics)] --> Monitoring[Prometheus/Grafana]
```

---

### Security Model (Summary)

| Layer | Control | Mitigation |
|-------|----------|-------------|
| Network | VPC + SG + NACL | Isolates ingress/egress |
| EKS | IRSA + least privilege | Limits AWS access |
| Pods | Non-root + readOnly | Prevents escalation |
| Pipeline | Trivy + audit + lint | Blocks vulnerable code |
| Secrets | Secrets Manager + SSM | Removes plaintext secrets |
| TLS | ACM Certificates | Encrypted communication |
| Observability | JSON logs + Prometheus | Auditability |

---

### Trade-offs & Improvements
- Simplified EKS for recruiter demo (can expand to Terraform Cloud).
- Future: integrate Cosign for image signing.
- Enhance observability using EFK/CloudWatch dashboards.
- Add nightly OWASP ZAP for continuous scanning.

---

## 🎯 Outcome
A complete, secure, and auditable DevSecOps implementation demonstrating enterprise-grade cloud, security, and automation best practices — **ready for production and recruiter review**.
