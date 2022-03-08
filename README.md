# mesh-mssql-docker (Purely intended for DEV)
Docker compose to spin up MESH with MS SQL Server.
This will help you to get started with MESH and a DB server backing the application up, in no time!

# How to run?
Clone the repo 'anywhere'. 
Make sure you're logged in to your jfrog-docker registry. If not, run the below:
```text
docker login ncr-fsg-ess-docker-releases.jfrog.io
```

And then -
You could either use IntelliJ docker plugin to run the docker-compose.yml file,

OR,

Go to the repo directory and run in the command prompt - 
```text
docker-compose up -d
```

# Pre-requisites!!
1. Configure the C:/ncr relevant properties for MESH.
   ```text
   Edit the property files.
      Assuming that all the relevant property files that are used by mesh are placed in "C:\ncr" directory, do the following:
      - Change all occurrences of "localhost" to "host.docker.internal".
      - Change all occurrences of "127.0.0.1" to <your-internal-IP-Address>.
   Files that needs to be edited with the above changes are - 
      - wasp.properties
      - cxth.runtime.properties
      - cxth.properties
      - cxth.io.properties
      - cxp.sqlserver.properties
      - cxp.properties
   ```
3. Put all the relevant liquibase scripts under one folder **(configurable in .env file)** and should have the following three folders/sources -
   - cxp
   - commonservices
   - terminalmanager
   ```text
   NOTE:
   1. cxp folder can be found in below (add the correct mesh version) -
      https://ncr.jfrog.io/artifactory/fsg-ess-maven-releases/com/ncr/cxp/cxp-release-package/02.09.16-GA/cxp-release-package-02.09.16-GA.zip
   2. Change the below .sql files to comment the use of "xp_cmdshell" (as its not required in linux env)
      - \<your-folder>\commonservices\create\sql\mssql\cxthcs_createDatabase_mssql.sql
      - \<your-folder>\terminalmanager\create\sql\mssql\cxthtm_createDatabase_mssql.sql
   ```

# The .env file -
You would find a file named `.env` which you would need to configure to your requirements.
- `COMPOSE_PROJECT_NAME` : The name of your docker stack
- `MESH_VERSION` : The version of MESH you would want to install.
- `MESH_DATALOAD_DIR` : The "dataload" directory for MESH
- `LIQUIBASE_SCRIPTS_DIR` : The directory that contains all the relevant liquibase scripts
