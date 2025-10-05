# Provenance Note

This file explains how the Git commit SHA flows into the running application for observability and tracing.

1. **CI injects GIT SHA**  
   - During the GitHub Actions `build-image-and-scan` job, the pipeline uses the current commit SHA (`${{ github.sha }}`) as an image tag and build-arg:
     ```
     docker build --build-arg COMMIT_SHA=${{ github.sha }} -t todos-service:${{ github.sha }} .
     ```

2. **Helm deployment sets env var and image tag**  
   - The `deploy-to-eks` job runs `helm upgrade --install` with `--set image.tag=${{ github.sha }}` and `--set env.COMMIT_SHA=${{ github.sha }}` so the pod has the correct env var and image.
   - The app reads `COMMIT_SHA` at runtime and returns it in `/healthz`.

3. **Why this is useful**  
   - Traceability from running pods back to the exact git commit improves debugging, auditing and rollback capabilities.
