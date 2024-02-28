# Visualisation

This section contains a dockerfile to setup Apache Superset for visualisation & reporting of the retail data from our analytics database

### Details 

The dockerfile takes the latest base image of Apache Superset.<br>
The directory also contains `superset-init.sh`. This is the entrypoint to initialise SuperSet once the docker container runs.<br>

The `superset-init.sh` file will create an admin user, set permissions & then start the superset server.<br>
It will then run `/usr/bin/run-server.sh` which starts the server for Apache Superset, which opens the web interface. <br>
