## Deleting provisioned alerts

Via API

    curl -XDELETE -H "X-Disable-Provenance: true" "http://<user>:<password>@localhost:3000/api/v1/provisioning/alert-rules/<uid>


or via config file by providing key `deleteRules` and specifying all UIDs

    deleteRules:
    - orgId: 1
      uid: my-uid

## Solving "Database locked, sleeping then retrying"

When using sqlite this means you have a deadlock. Fix it as described [here](https://community.grafana.com/t/database-is-locked-unable-to-use-grafana-anymore/16557)
