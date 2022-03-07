#!/bin/bash
set +v
export adminUser=$1
export adminPassword=$2
export dbname=CXP
export schemaName=CXP_OWNER
export userName=$3
export password=$4
export databaseip=localhost

export organization=/
export shortOrgName=root

/opt/mssql-tools/bin/sqlcmd -S $databaseip -i "/mnt/liquibase-scripts/cxp/sqlServer/create/common/01_SA_CreationUser.sql" -U $adminUser -P $adminPassword -v dbname=$dbname -v schemaName=$schemaName -v userName=$userName -v password=$password -v organization=$organization -v shortOrgName=$shortOrgName
/opt/mssql-tools/bin/sqlcmd -S $databaseip -i "/mnt/liquibase-scripts/cxp/sqlServer/create/common/02_CXP_CreationDB.sql" -d $dbname -U $userName -P $password -v dbname=$dbname
/opt/mssql-tools/bin/sqlcmd -S $databaseip -i "/mnt/liquibase-scripts/cxp/sqlServer/create/common/03_dashboard-createmodel.sql" -d $dbname -U $userName -P $password
/opt/mssql-tools/bin/sqlcmd -S $databaseip -i "/mnt/liquibase-scripts/cxp/sqlServer/create/common/04_security-portletregistry.sql" -d $dbname -U $userName -P $password
/opt/mssql-tools/bin/sqlcmd -S $databaseip -i "/mnt/liquibase-scripts/cxp/sqlServer/create/common/05_terminal-createmodel.sql" -d $dbname -U $userName -P $password
/opt/mssql-tools/bin/sqlcmd -S $databaseip -i "/mnt/liquibase-scripts/cxp/sqlServer/create/common/06_dashboard-populate.sql" -d $dbname -U $userName -P $password
/opt/mssql-tools/bin/sqlcmd -S $databaseip -i "/mnt/liquibase-scripts/cxp/sqlServer/create/common/07_language-createmodel.sql" -d $dbname -U $userName -P $password
/opt/mssql-tools/bin/sqlcmd -S $databaseip -i "/mnt/liquibase-scripts/cxp/sqlServer/create/common/08_language-populate.sql" -d $dbname -f 65001 -U $userName -P $password
/opt/mssql-tools/bin/sqlcmd -S $databaseip -i "/mnt/liquibase-scripts/cxp/sqlServer/create/common/09_read-commit-snapshot.sql" -d $dbname -U $adminUser -P $adminPassword


cd /mnt/liquibase-scripts/cxp/sqlServer/update
liquibase --defaultsFile="cxp.liquibase.sqlserver.properties"  update
