# pipecd-test-app

Test manifests for manual testing of the `kubernetes_multicluster` PipeCD plugin across two clusters (`cluster-eu` and `cluster-us`).

Each folder is a self-contained app registered in PipeCD with its own pipeline.

## Folders

| Folder | Pipeline |
|---|---|
| `canary-rollout-no-service/` | `K8S_CANARY_ROLLOUT` |
| `canary-rollout-with-service/` | `K8S_CANARY_ROLLOUT` with `createService: true` |
| `canary-clean-no-service/` | `K8S_CANARY_ROLLOUT` → `K8S_CANARY_CLEAN` |
| `canary-clean-with-service/` | `K8S_CANARY_ROLLOUT` → `K8S_CANARY_CLEAN` with service |
| `primary-rollout-no-service/` | `K8S_PRIMARY_ROLLOUT` |
| `primary-rollout-with-service/` | `K8S_PRIMARY_ROLLOUT` with `createService: true` |
| `baseline-rollout/` | `K8S_CANARY_ROLLOUT` → `K8S_BASELINE_ROLLOUT` |
| `baseline-clean-with-service/` | `K8S_BASELINE_ROLLOUT` → `K8S_BASELINE_CLEAN` with service |
| `full-pipeline/` | `K8S_CANARY_ROLLOUT` → `K8S_BASELINE_ROLLOUT` → `K8S_CANARY_CLEAN` → `K8S_BASELINE_CLEAN` |
| `traffic-routing-podselector/` | `K8S_CANARY_ROLLOUT` → `K8S_TRAFFIC_ROUTING` (PodSelector) → `K8S_PRIMARY_ROLLOUT` → `K8S_CANARY_CLEAN` |
| `traffic-routing-istio/` | `K8S_CANARY_ROLLOUT` → `K8S_BASELINE_ROLLOUT` → `K8S_TRAFFIC_ROUTING` (Istio) → `K8S_PRIMARY_ROLLOUT` → `K8S_CANARY_CLEAN` → `K8S_BASELINE_CLEAN` |
| `multi-target/` | `K8S_CANARY_ROLLOUT` → `K8S_PRIMARY_ROLLOUT` → `K8S_CANARY_CLEAN` across `cluster-eu` and `cluster-us` |
| `per-stage-filtering/` | Canary on `cluster-eu` only (`multiTargets: [cluster-eu]`), then `K8S_PRIMARY_ROLLOUT` on all targets |
| `multi-target-kustomize/` | Per-target `kustomizeDir` — `cluster-eu` and `cluster-us` each have their own kustomize overlay |

## Each folder contains

- `app.pipecd.yaml` — PipeCD app config with the pipeline stages
- `deployment.yaml` — Kubernetes Deployment manifest
- `service.yaml` — Service manifest (where applicable)

## How to register an app

In the PipeCD UI → **Add Application** → select **both** `cluster-eu` and `cluster-us` as deploy targets → point at the folder in this repo.
