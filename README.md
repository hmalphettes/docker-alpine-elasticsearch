Small Docker container to run elasticsearch-2
---------------------------------------------

- Alpine Linux / Glibc / Zulu-JRE.
- When launched as root startup script detects the user and group of the data folder and generate an elasticsearch user
- Small: 100MB

Usage
-----
```
docker run --rm -ti -v /home/core/share/data:/data hmalphettes/alpine-elasticsearch
```

Environment variables:

- CLUSTER_NAME=${CLUSTER_NAME:-elasticsearch-default}
- NODE_MASTER=${NODE_MASTER:-true}
- NODE_DATA=${NODE_DATA:-true}
- HTTP_ENABLE=${HTTP_ENABLE:-true}
- MULTICAST=${MULTICAST:-false}
- CONFIG_DIR=${CONFIG_DIR:-/elasticsearch/config}
- PLUGINS_DIR=${PLUGINS_DIR:-/elasticsearch/plugins}
