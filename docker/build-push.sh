#!/bin/bash
cd $(dirname $0)
set -e
export DTZAR_HELM_KUBECTL_VERSION=$(cat dtzar-helm-kubectl-version.txt)
docker compose build b6p-snapshotter
docker push ghcr.io/bluestep-systems/b6p-snapshotter:latest
docker push ghcr.io/bluestep-systems/b6p-snapshotter:${DTZAR_HELM_KUBECTL_VERSION}
