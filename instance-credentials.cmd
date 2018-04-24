kubectl create secret generic cloudsql-instance-credentials \
    --from-file=credentials.json=service-sqlproxy.json
