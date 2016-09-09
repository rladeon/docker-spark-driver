#using the spark-docker image we just created as our base image
FROM rladeon/spark-2
 
#app.jar is our Fat Jar to be run; here we assume it’s in the same build context as the Dockerfile;
COPY SimpleApp.jar /opt/SimpleApp.jar
 
#calling the spark-submit command; with the --class argument being an input environment variable
#docker build -t rladeon/spark-driver .
#docker run -it rladeon/spark-driver
#172.17.0.2:7077
CMD ${SPARK_HOME}/bin/spark-submit --class "SimpleApp" --master spark://172.17.0.2:7077 /opt/SimpleApp.jar

