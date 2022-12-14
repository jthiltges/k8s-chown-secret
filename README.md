# k8s-chown-secret

Synchronize a kubernetes secret or configmap to a new path, applying ownership and permission changes

## Input variables and defaults

```
SOURCE_DIR = /source
TARGET_DIR = /target

TARGET_CHOWN = 0:0
TARGET_CHMOD = F0600
```
