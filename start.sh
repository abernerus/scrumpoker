#!/bin/bash
echo "Pulling latest updates"
git pull
echo "Building"
mvn clean install
echo "Killing old process"
ps -ef | grep scrum | grep -v color | awk '{print $2}'
kill `ps -ef | grep scrum | grep -v color | awk '{print $2}'`
echo "Starting spring boot app!"
java -Xmx64m -jar target/wedding-1.0.0.jar &
