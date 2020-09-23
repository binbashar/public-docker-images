#!/bin/bash
set -e

# make sure the required directory exists
mkdir -p /root/.kube

# real entrypoint
exec "$@"
