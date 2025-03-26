ARG DTZAR_HELM_KUBECTL_VERSION
FROM dtzar/helm-kubectl:${DTZAR_HELM_KUBECTL_VERSION}
LABEL org.opencontainers.image.source=https://github.com/Bluestep-Systems/bluestep-git
LABEL org.opencontainers.image.description="Bluestep K8s Snapshotter"

ENTRYPOINT [ "/snapshotter.sh" ]
COPY snapshotter.sh /snapshotter.sh