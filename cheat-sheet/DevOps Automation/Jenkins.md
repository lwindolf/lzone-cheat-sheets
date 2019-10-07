## JSON API Calls

    # Print name of all known jobs
    GET /api/json?tree=jobs[name]&pretty=true

    # Enable a job
    POST /job/enable

    # Run job without parameters
    POST /<name>/build

    # Run job with parameters
    POST /<name>/buildWithParameters?<params>

## List all job paths

    Jenkins.instance.getAllItems(AbstractItem.class).each {
  	  println(it.fullName)
    };
    
## Cancel all jobs

    import hudson.model.*
    
    def q = Jenkins.instance.queue
    
    q.items.each { q.cancel(it.task) }

## Dump Plugin Versions

    Jenkins.instance.pluginManager.plugins.each{
      plugin -> 
        println("${plugin.getShortName()}:${plugin.getVersion()}")
    }

## Tracking builds

Jenkins 1.x

1.  First get the queue number return by the POST that started the call
2.  Wait some seconds! Yes, honestly!
3.  Fetch the build id using

        GET /<job name>/lastBuild/buildNumber

4.  Once you have the build id poll the status with

        GET /<job name>//api/json


## CasC Plugin

- [CaSC Example Setup](https://ifritltd.com/2018/03/18/advanced-jenkins-setup-creating-jenkins-configuration-as-code-and-applying-changes-without-downtime-with-java-groovy-docker-vault-consul-template-and-jenkins-job/)

## Scripted API Calls

[How to use API tokens with scripts](https://wiki.jenkins.io/display/JENKINS/Authenticating+scripted+clients)
