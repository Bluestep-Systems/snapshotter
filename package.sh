#!/bin/bash
set -e
cd $(dirname ${0})
helm package helm -d ../charts
helm repo index ../charts --url https://bluestep-systems.github.io/charts
