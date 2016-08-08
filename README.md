This image provides a JMeter 3.0 with MSSQL and PostgreSQL JDBC Drivers.

Below steps examplify the usage of the image.

1. Add your jmx files to the image.

    ```
    FROM gsengun/jmeter3.0:latest

    COPY DemoTest.jmx /scripts/DemoTest.jmx
    ```

2. Build the docker image.

    ```
    docker build -t jmetertest .
    ```

3. Run the test with below command.

    ```
    docker run jmetertest jmeter -n -t /scripts/DemoTest.jmx -l DemoTest.jtl
    ```
