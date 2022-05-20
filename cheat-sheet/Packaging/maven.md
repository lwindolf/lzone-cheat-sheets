## Configure private registry

To do so change `/etc/maven/settings.xml`.

Ensure to provide server credentials: 

  <servers>
    <server>
      <username>!!!!!!!!!!!</username>
      <password>!!!!!!!!!!!</password>
      <id>central</id>
    </server>
    <server>
      <username>!!!!!!!!!!!</username>
      <password>!!!!!!!!!!!</password>
      <id>snapshots</id>
    </server>
  </servers>

And configure repos under 

- /profiles/profile/repositories
- /profiles/profile/pluginRepositories

like this example

    <repository>
      <snapshots>
        <enabled>false</enabled>
      </snapshots>
      <id>central</id>
      <name>!!!some name!!!</name>
      <url>!!!private registry URL!!!</url>
    </repository>
