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

Local shell (on packer host)

    {
      "type": "local-shell",
      "inline": [
        "rm somefile.txt"
      ]
    }

## File Transfer
### Copying files into build

	{
		"type": "file",
		"source": "data/some-software.tar.gz",
		"destination": "/some-software.tar.gz"
	},

### Extracting files from build

Useful to get logs or scan results

	{
		"type": "file",
		"direction": "download",
		"source": "/report.zip",
		"destination": "results/report.zip"
	},

## Windows

### Using WinRM

For Windows you want to use [WinRM](https://www.packer.io/docs/communicators/winrm) instead of SSH

    "builders": [
    	{
		"communicator": "winrm",
		"winrm_use_ssl": true,
		"winrm_insecure": false,
		"winrm_use_ntlm": true,
		"winrm_timeout": "10m",
		"winrm_username": "packer",
		[...]
	}
    ]
    
### Opening WinRM for CIS hardened images

On hardened images you might have to force enable WinRM before being able to use it. For example on Azure

	az vm run-command invoke \
		--command-id RunPowerShellScript \
		--name "<vm>" \
		-g "<resource group>" \
		--scripts @<script>

with the script containing something like 

	Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'FilterAdministratorToken' -Value 0 -Force
	& GPUpdate /Force

Note that you need to run this only after packer say `Waiting for WinRM to become available` in its output.
Finally: do not forget to close this again after your are done building the image.
