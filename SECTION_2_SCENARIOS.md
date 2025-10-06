# ✅ SECTION_2_SCENARIOS.md
## Section 2 — Scenario Questions :

---

### 1. Incident Response: EKS workloads show suspicious egress spikes to unknown IPs

**Immediate Containment:**  
Isolate affected pods by applying a restrictive **NetworkPolicy (deny-all)** and scaling down workloads to prevent data exfiltration.  
Revoke temporary IAM access tokens and rotate credentials.

**Evidence Capture:**  
Collect **kubectl describe**, **pod logs**, **VPC Flow Logs**, and **CloudTrail** data for forensics. Snapshot node volumes for analysis.

**Short-term Monitoring:**  
Enable **GuardDuty**, **AWS Security Hub**, and Prometheus alerts for abnormal network traffic patterns.

**24-hour Actions:**  
Perform pod and image scanning (Trivy/Grype), validate supply chain integrity, patch vulnerabilities, and restore from trusted images with signed provenance.

---

### 2. Secrets: Junior dev proposes .env with DB creds committed to a private repo

**Risks:**  
- Even private repos can be breached or cloned, exposing credentials.  
- Violates least-privilege and secret rotation principles.  
- Credentials may propagate via CI/CD logs and backups.

**Migration Plan:**  
1. Move secrets to **AWS Secrets Manager** or **SSM Parameter Store**.  
2. Refactor application to load credentials at runtime using **IRSA** for IAM authentication.  
3. Implement **automatic rotation policies** and revoke leaked secrets.  
4. Add a **Git pre-commit hook** or `truffleHog` scan to prevent future secret leaks.

---

### 3. Zero-Trust in Kubernetes

**Identity:** Enforce **IRSA** so pods use least-privileged IAM roles, tied to specific service accounts.  
**Policy:** Apply **RBAC** to scope permissions per namespace and role.  
**Segmentation:** Use **NetworkPolicies** to restrict pod-to-pod communication by namespace and label.  
**Encryption & Trust:** Implement **mTLS** via a service mesh (e.g., Istio/Linkerd) to authenticate and encrypt intra-cluster traffic.

Together, these enforce the principle that *no entity is trusted by default, and all access is verified and auditable.*

---

### 4. Supply Chain Security

**Mitigation Strategy:**  
- **Base Images:** Pin images by digest and use **verified publishers (Docker Hub official or AWS ECR Public)**.  
- **Dependencies:** Run `npm audit` and integrate **Trivy/Grype** scans into CI/CD.  
- **SBOM:** Generate using **Syft**, store as CI artifact for compliance.  
- **Provenance:** Include Git SHA and image digest in `/healthz` for traceability (SLSA Level 2 approach).  
This ensures tamper-resistance and transparency from build to runtime.

---

### 5. Cost vs Security — Leadership proposes disabling image scanning

**Recommendation:**  
Maintain **security gates** while optimizing cost and time:  
1. Introduce **severity-based thresholds** (block on Critical, warn on Medium).  
2. **Async nightly scans** for full audit while keeping fast CI builds.  
3. Maintain **allowlists** for accepted base image CVEs with justification.  
4. Report scan metrics in dashboards to show ROI of secure releases.

Balance can be achieved through **risk-based controls** without removing critical safeguards.

---

## 🎯 Outcome

This section demonstrates real-world **DevSecOps incident handling, zero-trust implementation, and governance thinking**.  
Each answer emphasizes **risk-aware, practical responses** that recruiters value in senior cloud and security engineers.
