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
        - name: myContainer
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

## Volumes from ConfigMaps

### Overlay a directory

Given a config map with multiple keys that are filenames you can

    spec:
       containers:
         - name: myContainer
           volumeMounts:
             - name: my-config
               mountPath: /etc/somedir             # absolute target DIRECTORY
       volumes:
         - name: my-config
           configMap:
             name: my-config-map
             
To only mount a single file using a single key from the configMap

    spec:
       containers:
         - name: myContainer
           volumeMounts:
             - name: my-config
               mountPath: /etc/somedir/             # absolute target DIRECTORY
       volumes:
         - name: my-config
           configMap:
             name: my-config-map
             items:
               key: somefile                        # <--- CM key reference
               path: somefile
               
Note though about example will hide all contents of /etc/somedir despite only injecting a single file.

An alternative is to use `subPath` in the volume mount:

    spec:
       containers:
         - name: myContainer
           volumeMounts:
             - name: my-config
               mountPath: /etc/somedir/somefile       # absolute target FILE
               subPath: somefile                      # CM <--- key reference
       volumes:
         - name: my-config
           configMap:
             name: my-config-map
