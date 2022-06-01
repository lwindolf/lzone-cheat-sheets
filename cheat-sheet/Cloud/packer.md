## Templating

   {{ env `HOME` }}             # Insert environment variable from build env
   {{ user `SOME_CONFIG` }}     # Insert a user variable from the packer.json

## Provisioners Examples

Shell with env and script transfer

    { 
      "type": "powershell",
      "environment_vars": [ 
        "ENV_VAR1=value1",
        "ENV_VAR2=value2"
      ],
      "scripts": [
        "scripts/myscript.ps1"
      ]
    },

Inline multiple shell commands with parameters (no script transfer)

    {
      "type": "bash",
      "inline": [
        "apt-get -y install curl",
        "curl https://example.com/download.tar.gz",
        "tar zxvf download.tar.gz"
      ]
    }

## Extracting files from build

Useful to get logs or scan results

		{
    		"type": "file",
		    "direction": "download",
    		"source": "/report.zip",
    		"destination": "results/report.zip"
 		},
