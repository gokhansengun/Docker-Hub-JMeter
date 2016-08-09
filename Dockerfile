FROM java:7

MAINTAINER Gokhan Sengun <gokhansengun@gmail.com>

ADD http://www-us.apache.org/dist/jmeter/binaries/apache-jmeter-3.0.zip /apache-jmeter-3.0.zip

RUN unzip /apache-jmeter-3.0.zip && rm /apache-jmeter-3.0.zip && mv /apache-jmeter-3.0 /jmeter && ln -s /jmeter/bin/jmeter /usr/local/bin/jmeter

# Copy plugins folder under ext folder
COPY plugins/ /jmeter/lib/ext/

# Copy MSSQL and PostgreSQL JDBC Drivers
COPY jdbc/postgresql-9.4.1209.jre7.jar /jmeter/lib/
COPY jdbc/sqljdbc4.jar /jmeter/lib/

# Change workdir to /jmeter
WORKDIR /jmeter

ENTRYPOINT [ "jmeter" ]

CMD [ "--help" ]