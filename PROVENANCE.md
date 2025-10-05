# PROVENANCE.md

The CI pipeline tags built images with the Git commit SHA and injects it into the running pods via the COMMIT_SHA env var. The app exposes this on /healthz to enable traceability.
