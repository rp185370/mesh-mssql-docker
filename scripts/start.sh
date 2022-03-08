# Create the two database directories
mkdir "/opt/mssql/CXTHCS"
mkdir "/opt/mssql/CXTHTM"

# Prepare databases once sqlserver is online
for i in {1..10};
do
    echo "Trying to setup - Attempt $i"
    /opt/mssql-tools/bin/sqlcmd -U sa -P "$SA_PASSWORD" -s localhost -v DataFolder="/opt/mssql" DBName="CXTHCS" SvrMaxMem="4048" BPEEnabled="0" BPERatio="1024" RecModel="SIMPLE" MDFSize="10" MDFGrowth="100" MDFMaxSize="1024" LDFSize="10" LDFGrowth="100" LDFMaxSize="UNLIMITED" -i "/mnt/liquibase-scripts/commonservices/create/sql/mssql/cxthcs_createDatabase_mssql.sql" -r
    if [ $? -eq 0 ]
    then
        /opt/mssql-tools/bin/sqlcmd -U sa -P "$SA_PASSWORD" -s localhost -v DataFolder="/opt/mssql" DBName="CXTHTM" SvrMaxMem="4048" BPEEnabled="0" BPERatio="1024" RecModel="SIMPLE" MDFSize="10" MDFGrowth="100" MDFMaxSize="1024" LDFSize="10" LDFGrowth="100" LDFMaxSize="UNLIMITED" -i "/mnt/liquibase-scripts/terminalmanager/create/sql/mssql/cxthtm_createDatabase_mssql.sql" -r
        /home/prepareCxth.sh
		    /home/prepareCxp.sh sa "$SA_PASSWORD" CXP_OWNER CXP_OWNER
        echo "========================> Setup Completed"
        break
    else
        echo "========================> not ready yet..."
        sleep 5
    fi
done
