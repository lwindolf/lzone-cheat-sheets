## Create a PVC

Create a shared RWX `ReadWriteMany` PVC named `pvc-rwx-0001`

    ---
    apiVersion: v1
    kind: PersistentVolumeClaim
    metadata:
      name: pvc-rwx-0001
      namespace: myns
    spec:
      accessModes:
        - ReadWriteMany
      volumeMode: Filesystem
      resources:
        requests:
          storage: 100M
      storageClassName: cinder-standard-nova
