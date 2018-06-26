# Grafana setup with Prometheus and InfluxDB

## Start the experiment
```sh
docker-compose up [-d]
```

Access the components:
- Grafana: http://localhost:3000 (admin:admin)
- Prometheus: http://localhost:9090
- InfluxDB localhost:8086

## Import Influx data
For importing data to InfluxDB Python is required. Start import from docker host with following command.

```sh
cd $PROJECT_FOLDER/volumes/influx/rawdata/
./run.sh
```

## Stop the experiment
```sh
docker-compose down
```

