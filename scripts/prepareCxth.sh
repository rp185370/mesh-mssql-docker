#!/bin/bash

# Create CXTHCS
cd /mnt/liquibase-scripts/commonservices
liquibase --defaultsFile=./cxthcs.mssql.user.properties --changeLogFile=./create/cxthcs_datafiles.xml --databaseChangeLogTableName=CXTHCS_DATABASECHANGELOG --databaseChangeLogLockTableName=CXTHCS_DATABASECHANGELOGLOCK update -DdataFilePathTemp="/opt/mssql/CXTHCS" -DdataFilePath="/opt/mssql/CXTHCS"
liquibase --defaultsFile=./cxthcs.mssql.user.properties --changeLogFile=./update/cxthcs_objects.xml --databaseChangeLogTableName=CXTHCS_DATABASECHANGELOG --databaseChangeLogLockTableName=CXTHCS_DATABASECHANGELOGLOCK update -DdataFilePath="/opt/mssql/CXTHCS"

# Create CXTHTM
cd /mnt/liquibase-scripts/terminalmanager
liquibase --contexts="non-part" --defaultsFile=./cxthtm.mssql.user.properties --changeLogFile=./create/cxthtm_datafiles.xml --databaseChangeLogTableName=CXTHTM_DATABASECHANGELOG --databaseChangeLogLockTableName=CXTHTM_DATABASECHANGELOGLOCK update -DdataFilePathTemp="/opt/mssql/CXTHTM" -DdataFilePath="/opt/mssql/CXTHTM"
liquibase --contexts="non-part" --defaultsFile=./cxthtm.mssql.user.properties --changeLogFile=./update/cxthtm_objects.xml --databaseChangeLogTableName=CXTHTM_DATABASECHANGELOG --databaseChangeLogLockTableName=CXTHTM_DATABASECHANGELOGLOCK update -DdataFilePath="/opt/mssql/CXTHTM"
