# SECURITY_CONTROLS.md

See PROVENANCE.md and README.md for full project flow.

Highlights:
- Terraform state: S3 with SSE-KMS + DynamoDB locking.
- IRSA for least-privilege access to DynamoDB.
- Secrets in AWS Secrets Manager or SSM Parameter Store (no plaintext in repo).
- ACM for TLS on ALB in production; cert-manager + self-signed ok for test.
- Image scanning with Trivy; fail on High/Critical.
- Pod hardening: non-root, readOnlyRootFilesystem, drop NET_RAW, disallow privilege escalation.
- NetworkPolicy: deny-all then allow from ingress controller.
