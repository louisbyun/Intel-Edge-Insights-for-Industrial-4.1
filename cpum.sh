#!/bin/bash

# Specify Docker container IDs or names
TARGET_CONTAINER1="7483e5b434d5" # Visualizer
TARGET_CONTAINER2="da85e118ef52" # Logitech StreamCam microservice 1
TARGET_CONTAINER3="9995d1436de4" # 720p HD Camera microservice 2

# Create CSV file header
echo "Timestamp,Container,CPU Usage,Memory Usage" > docker_stats.csv

while true; do
    DATE=$(date '+%Y-%m-%d %H:%M:%S')

    # Collect stats for each Docker container
    CONTAINER1_STATS=$(docker stats --no-stream --format "{{.Container}},{{.CPUPerc}},{{.MemUsage}}" $TARGET_CONTAINER1 2> /dev/null || true)
    CONTAINER2_STATS=$(docker stats --no-stream --format "{{.Container}},{{.CPUPerc}},{{.MemUsage}}" $TARGET_CONTAINER2 2> /dev/null || true)
    CONTAINER3_STATS=$(docker stats --no-stream --format "{{.Container}},{{.CPUPerc}},{{.MemUsage}}" $TARGET_CONTAINER3 2> /dev/null || true)
    
    # Extract CPU usage and current memory usage
    CONTAINER1_CPU=$(echo $CONTAINER1_STATS | awk -F, '{print $2}')
    CONTAINER1_MEMORY=$(echo $CONTAINER1_STATS | awk -F, '{print $3}' | awk '{print $1}' | sed 's/MiB//')

    CONTAINER2_CPU=$(echo $CONTAINER2_STATS | awk -F, '{print $2}')
    CONTAINER2_MEMORY=$(echo $CONTAINER2_STATS | awk -F, '{print $3}' | awk '{print $1}' | sed 's/MiB//')

    CONTAINER3_CPU=$(echo $CONTAINER3_STATS | awk -F, '{print $2}')
    CONTAINER3_MEMORY=$(echo $CONTAINER3_STATS | awk -F, '{print $3}' | awk '{print $1}' | sed 's/MiB//')

    # Append collected information to the CSV file (one line for each container)
    echo "$DATE,$TARGET_CONTAINER1,$CONTAINER1_CPU,$CONTAINER1_MEMORY" >> docker_stats.csv
    echo "$DATE,$TARGET_CONTAINER2,$CONTAINER2_CPU,$CONTAINER2_MEMORY" >> docker_stats.csv
    echo "$DATE,$TARGET_CONTAINER3,$CONTAINER3_CPU,$CONTAINER3_MEMORY" >> docker_stats.csv

    # Repeat every 10 minutes
    sleep 600
done
