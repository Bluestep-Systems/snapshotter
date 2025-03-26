# Bleustep snapshotter

## Package
```bash
helm package helm -d ../../charts
helm repo index ../../charts
```
## Add to repository to local installation
```bash
helm repo add bluestep-systems https://bluestep-systems.github.io/charts
```

## To update Helm repositories after changes to https://bluestep-systems.github.io/charts
```bash
helm repo update
```