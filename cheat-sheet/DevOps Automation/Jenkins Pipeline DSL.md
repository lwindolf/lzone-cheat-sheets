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
