## Using Kubernetes

When running jobs as Kubernetes pods you need to specify/inherit [podTemplates](https://github.com/jenkinsci/kubernetes-plugin)

    def label = "mypod-${UUID.randomUUID().toString()}"    // ugly necessary workaround
    podTemplate(label: label, containers: [
      // You can have as many containers as you want...
      containerTemplate(name: 'maven', image: 'maven:3.3.9-jdk-8-alpine', ttyEnabled: true, command: 'cat'),
      containerTemplate(name: 'golang', image: 'golang:1.8.0', ttyEnabled: true, command: 'cat')
    ]) {

      node(label) {
        container('maven') {
          // do something with Maven
        }
        container('golang') {
          // do something with go
        }
      }
    }

Instead of explicitely specifying the pod template you can inherit templates and overwrite only some of the
values...

    podTemplate(label: 'mypod', inheritFrom: 'basepod) {
      ...
    }

### Understand the internals!

Keep in mind the following:

- there is always a container 'jnlp' which runs the Jenkins agent
- when you do not use `container('...') {}` you are running inside the 'jnlp' container
- you can override the 'jnlp' container by defining your own `containerTemplate(name:'jnlp', ...)`
- SCM checkout *always* happens in the 'jnlp' container!

### Docker-in-Docker

If you want to build docker images you have to run docker on-top of kubernetes. One possibility is Docker-in-Docker (DinD). Example:

    podTemplate(label: 'dind', containers: [
      containerTemplate(name: 'docker', image: 'docker:dind', ttyEnabled: true, privileged: true,
        command: 'dockerd --host=unix:///var/run/docker.sock --host=tcp://0.0.0.0:2375 --storage-driver=overlay')
      ],
      volumes: [emptyDirVolume(memory: false, mountPath: '/var/lib/docker')]) {
        container(docker) {
          docker.build()
        }
      }
    }

## Handling the environment

Query all env variables

    node {
      echo sh(returnStdout: true, script: 'env | sort')
    }

Access an env variable

    echo env.BUILD_ID
    echo "My build is is ${env.BUILD_ID}"

## SCM Checkout

For Jenkinsfiles located in the repo perform checkout like this

    checkout scm

To check out other repos not provide automatically by the SCM plugin

    git credentialsId: 'github', url: ${REPO_URL}, branch: 'master'

## Credentials

### Username and Password

Fetch user and password into env variables

    withCredentials([usernamePassword(
                       credentialsId: 'myCredentials',
                       usernameVariable: 'USER',
                       passwordVariable: 'PASSWORD'
                   )]) {
      sh 'echo user "$USER" pasword "$PASSWORD"'
    }
 
 or
 
    withCredentials([[$class: 'UsernamePasswordMultiBinding',
                      credentialsId: 'myCredentials', 
                      usernameVariable: 'USER', 
                      passwordVariable: 'PASSWORD'
                    ]]) {
      sh 'echo user "$USER" pasword "$PASSWORD"'
    }
    
### Secret Files

    withCredentials([file(credentialsId: 'myCredentials', variable: 'MY_SECRET_TOKEN')]) {
       sh 'echo token "$MY_SECRET_TOKEN"'
    }
    
### Docker Registry Credentials

Do this using the docker plugin, not via the credential-binding plugin!

    docker.withRegistry('docker.example.com', 'myCredential') {
      docker.build(...)
    }
