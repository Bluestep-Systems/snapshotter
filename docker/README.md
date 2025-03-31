# b6p-snapshotter
```bash
export DTZAR_HELM_KUBECTL_VERSION=$(cat ./../installers/dtzar-helm-kubectl-version.txt)
docker compose build b6p-snapshotter
docker push ghcr.io/bluestep-systems/b6p-snapshotter:latest
docker push ghcr.io/bluestep-systems/b6p-snapshotter:${DTZAR_HELM_KUBECTL_VERSION}
```
