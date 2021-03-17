Config map use case examples

## All Environment Variables from ConfigMap

    spec:
      containers:
        - name: mycontainer
          envFrom:
            - configMapRef:
                name: myConfigMap

## Specific Environment Variables from ConfigMap

    spec:
      containers:
        - name: mycontainer
          env:
            - name: VAR1
              valueFrom:
                configMapKeyRef:
                  name: myConfigMap
                  key: VAR1
            - name: VAR2
              valueFrom:
                configMapKeyRef:
                  name: myConfigMap
                  key: VAR2
