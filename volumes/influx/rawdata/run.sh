#!/bin/bash
echo "check for running influxdb"
INFLUX="influx -host influxdb -port 8086"

influx -host influxdb -port 8086 -username admin -password admin \
      -database workshop -execute 'SHOW DATABASES' 2>/dev/null 1>&2

RESULT=$?
if [ $RESULT -eq 0 ]; then
  echo "influxdb started, run initial setup"

  # Intial Data Import
  cat ./influx_data.txt | ./build_influxdata.py > ./import.influx
  $INFLUX -precision s -import -path ./import.influx

fi
echo "no running influxdb"

# Random job for sample data
# random,host=server01,region=us-west value=0.64 1434055562000000000

#while true ; do
#  DATA="random_value,host=server01,region=us-west value=0.$(( $RANDOM %100 )) $(date +%s000000000)"
#  curl -s -u admin:admin -XPOST 'http://influxdb:8086/write?db=workshop' --data-binary "$DATA"
#
#  DATA="second_value,host=server01,region=us-west value=$(date +%S) $(date +%s000000000)"
#  curl -s -u admin:admin -XPOST 'http://influxdb:8086/write?db=workshop' --data-binary "$DATA"
#
#  sleep $(( $RANDOM %10 ));
#done;
