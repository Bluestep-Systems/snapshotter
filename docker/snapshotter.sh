#!/usr/bin/env bash

SNAPSHOT_NAME=${PVC_NAME}-$(date +${DATE_FORMAT})

# Check if the snapshot already exists
kubectl get volumesnapshot ${SNAPSHOT_NAME} &>/dev/null && { echo Snapshot already exists ; exit 1; }

# Prune old snapshots
xargs -r -n1 kubectl delete volumesnapshot \
< <( \
  kubectl get volumesnapshots \
  --sort-by=.metadata.creationTimestamp \
  -o jsonpath='{.items[*].metadata.name}' \
  -l pvc=${PVC_NAME},frequency=${FREQUENCY} \
  | rev | cut -s -d\  -f ${RETAIN}- | rev \
)

echo "Creating snapshot ${SNAPSHOT_NAME}"
cat <<EOF | kubectl apply -f -
apiVersion: snapshot.storage.k8s.io/v1
kind: VolumeSnapshot
metadata:
  name: ${SNAPSHOT_NAME}
  labels:
    pvc: ${PVC_NAME}
    frequency: ${FREQUENCY}
spec:
  volumeSnapshotClassName: ${VOLUME_SNAPSHOT_CLASS}
  source:
    persistentVolumeClaimName: ${PVC_NAME}
EOF