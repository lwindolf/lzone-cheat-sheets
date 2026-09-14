## Visual Studio Code mcp.json Examples

### Access via stdio

	{
	  "mcpServers": {
	    "my-mcp-server": {
	      "command": "node",
	      "args": ["./mcp.js"]
	    }
	  }
	}

### Access via HTTP

	{
		"mcpServers": {
			"my-mcp-server": {
				"url": "http://localhost:3000/mcp",
				"type": "http"
	    }
		}
	}

### Other options

	{
	  "mcpServers": {
	    "staging-db": {
				"url": "http://localhost:3000/mcp",
				"type": "http",
	      "headers": {
	        "Cookie"        : "cookievalue",
	        "Authorization" : "Bearer ${env:MCP_TOKEN}"
	      }
	      "env": {
	        "PARAM1": "value1",
	        "DATABASE_URL": "${env:DATABASE_URL}",
	      }
	    }
	  }
	}
