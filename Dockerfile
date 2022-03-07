FROM mcr.microsoft.com/mssql/server:2019-latest

ENV SA_PASSWORD=Passw0rd
ENV ACCEPT_EULA=Y

USER root

# Install Java to the image
RUN apt update \
    && apt install --no-install-recommends \
       default-jdk -y \
    && rm -rf /var/lib/apt/lists/*

# Install liquibase
ADD liquibase-4.4.3.tar.gz /home/liquibase
ENV PATH="/home/liquibase:${PATH}"

# Add sqlserver driver to liquibase
COPY sqljdbc42.jar /home/liquibase/lib

# Copy all the scripts to 'home'
COPY prepareCxth.sh /home
COPY prepareCxp.sh /home
COPY start.sh /home
COPY entrypoint.sh /home

# Run the boot point
RUN chmod +x /home/entrypoint.sh
CMD /bin/bash /home/entrypoint.sh