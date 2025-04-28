ARG DTZAR_HELM_KUBECTL_VERSION
FROM dtzar/helm-kubectl:${DTZAR_HELM_KUBECTL_VERSION:-latest}
LABEL org.opencontainers.image.source=https://github.com/Bluestep-Systems/snapshotter
LABEL org.opencontainers.image.description="Bluestep K8s Snapshotter"

HEALTHCHECK NONE

ENTRYPOINT [ "/snapshotter.sh" ]
COPY snapshotter.sh /snapshotter.sh