# mesh-mssql-docker
Docker compose to spin up MESH with MS SQL Server.
This will help you to get started with MESH and a DB server backing the application up, in no time!

# How to run?
Clone the repo 'anywhere'. And then -
You could either use IntelliJ docker plugin to run the docker-compose.yml file,

OR,

Go to the repo directory and run in the command prompt - 
```text
docker-compose up -d
```

# Pre-requisites!!
1. Configure the C:/ncr relevant properties for MESH.
2. Put all the relevant liquibase scripts under one folder (configurable in .env file) and should have the following three folders/sources -
   - cxp
   - commonservices
   - terminalmanager

# The .env file -
You would find a file named `.env` which you would need to configure to your requirements.
- `COMPOSE_PROJECT_NAME` : The name of your docker stack
- `MESH_VERSION` : The version of MESH you would want to install.
- `MESH_DATALOAD_DIR` : The "dataload" directory for MESH
- `LIQUIBASE_SCRIPTS_DIR` : The directory that contains all the relevant liquibase scripts
