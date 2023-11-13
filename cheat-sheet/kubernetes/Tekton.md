## CLI

    tkn task list               # List defined tasks
    tkn pipeline list           # List defined pipelines
    tkn resource list           # List pipeline resources (Git repos)
    
    tkn task start <name>
    tkn task start <name> -p namespace=<namespace> --showlog
    
    tkn task describe <name>

    tkn taskrun list            # List task runs
    tkn taskrun logs -L -f      # Follow task run logs

    tkn pipeline start <name>
    tkn pipeline start <name> -p namespace=<namespace> -p contextDir=. --showlog
