# EKS + Helm CI/CD package for Todos Service (Recruiter-friendly)

This package contains a production-minded GitHub Actions pipeline that builds, tests, scans and deploys the `todos-service` to Amazon EKS using Helm. It follows the assessment requirements:

- Build & Unit Tests: `npm ci` → `npm test`
- Static Analysis: ESLint (fail on error)
- Dependency Scan: `npm audit --audit-level=high`
- Image Build & Scan: Docker build with `COMMIT_SHA` build-arg and Trivy scan (fail on High/Critical)
- Deploy: EKS using `helm upgrade --install` with rolling update strategy
- Release metadata: Git SHA injected as `COMMIT_SHA` env var and recorded as provenance

## Required GitHub Secrets
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_REGION`
- `EKS_CLUSTER_NAME`
- `DOCKER_USERNAME` (optional, if pushing images)
- `DOCKER_PASSWORD` (optional)

## How to use
1. Copy this folder into the repo root (or merge files). Ensure `helm/todos` is present.
2. Configure the above GitHub repository secrets.
3. Push to `main`. CI will run and deploy to your EKS cluster.
