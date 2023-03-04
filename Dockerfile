FROM postgis/postgis:13-master

# Download and install Flyway
ADD https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/9.15.0/flyway-commandline-9.15.0-linux-x64.tar.gz /flyway.tar.gz
RUN tar xvf /flyway.tar.gz
RUN mv flyway-9.15.0 flyway
RUN chmod +x /flyway/flyway
RUN ln -s /flyway/flyway /usr/local/bin/flyway

# Install a driver to connect to Postgres via Unix socket since during initialization no TCP is available for the temporary Postgres instance
ADD https://github.com/kohlschutter/junixsocket/releases/download/junixsocket-2.6.2/junixsocket-dist-2.6.2-bin.tar.gz /junixsocket.tar.gz
RUN tar xvf /junixsocket.tar.gz
RUN mv /junixsocket-dist-2.6.2/lib/junixsocket-common-2.6.2.jar /flyway/drivers/junixsocket-common-2.6.2.jar
RUN mv /junixsocket-dist-2.6.2/lib/junixsocket-native-common-2.6.2.jar /flyway/drivers/junixsocket-native-common-2.6.2.jar

# Add Flyway script to init folder
COPY 20_flyway.sh /docker-entrypoint-initdb.d/20_flyway.sh
RUN chmod +x /docker-entrypoint-initdb.d/20_flyway.sh

# Copy Flyway configuration
COPY flyway.conf /flyway.conf

# Copy SQL files
COPY sql /sql
