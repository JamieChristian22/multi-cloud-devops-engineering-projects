# Promotion and rollback

Promote only the immutable artifact that passed CI. Change one environment per pull request. Production requires approval. Roll back by reverting the promotion commit; Argo CD reconciles the last known-good desired state.
