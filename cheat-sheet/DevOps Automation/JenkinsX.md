## Setup

    jx create cluster eks --cluster-name=<cluster name> --skip-installation=true
    jx create cluster gke --skip-installation
    
    jx boot

## Managing Applications

    jx create <app>
    jx create <app> -l <quickstart name>
    jx create <app> -f <quickstart filter>
    
    jx promote --app <app> --version <version> --env <env>
    
    jx promote -f redis --env staging     # Promote unmanaged 3rd party apps

## Handling pipelines

    jx step syntax validate pipeline

## Analyzing

    jx get activities
    jx get activities --filter <filter> [--watch]

## Managing Quickstarts / Buildpacks

Build packs are cached in ~/.jx/draft/packs

    jx create quickstartlocation --url https://mygit.server.com --owner my-quickstarts
    jx get qsloc
    jx delete qsloc <name>
