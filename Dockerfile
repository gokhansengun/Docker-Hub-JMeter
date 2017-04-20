FROM openjdk:7-jre

MAINTAINER Gokhan Sengun <gokhansengun@gmail.com>

ADD http://www-us.apache.org/dist/jmeter/binaries/apache-jmeter-3.1.zip /apache-jmeter-3.1.zip

RUN unzip /apache-jmeter-3.1.zip && rm /apache-jmeter-3.1.zip && mv /apache-jmeter-3.1 /jmeter && ln -s /jmeter/bin/jmeter /usr/local/bin/jmeter

RUN curl -L -o /usr/bin/jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 && chmod u+x /usr/bin/jq

# Copy plugins folder under ext folder
COPY plugins/ /jmeter/lib/ext/

# Copy MSSQL and PostgreSQL JDBC Drivers
COPY jdbc/postgresql-9.4.1209.jre7.jar /jmeter/lib/
COPY jdbc/sqljdbc4.jar /jmeter/lib/

# Change workdir to /jmeter
WORKDIR /jmeter

CMD [ "jmeter", "--help" ]
