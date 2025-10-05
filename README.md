# todos-service-devsecops

Production-grade DevSecOps repository combining the Node.js Todos app, CI/CD pipeline, and secure infrastructure templates.

See the top-level folders:
- src/ (app)
- helm/ (Helm chart for EKS)
- terraform/ (IaC templates)
- k8s/ (Kubernetes manifests)
- .github/workflows/ (CI/CD pipeline)

## Quickstart (developer)
1. Unzip and inspect files.
2. Install deps and run locally:
   ```bash
   npm ci
   npm start
   ```
3. Run tests:
   ```bash
   npm test
   ```

## CI/CD
Pipeline in `.github/workflows/ci-cd.yaml` builds, tests, scans and deploys to EKS via Helm. See README_CICD.md for details.

## Security
See SECURITY_CONTROLS.md for security hardening, secrets, and TLS guidance.
