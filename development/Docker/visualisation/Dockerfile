FROM apache/superset:latest

USER root

# install for superset to access Postgres DB 
RUN pip install psycopg2

# some "fake" environment variables that will exist, and then be used by the superset-init.sh script 
ENV ADMIN_USERNAME admin
ENV ADMIN_EMAIL admin_fake@hotmail.co.uk
ENV ADMIN_PASSWORD fake_password

# copy the script from current directory, to the base of the container
COPY ./development/Docker/visualisation/superset-init.sh /superset-init.sh

# copy the config script into a specific folder called /app
# set an env variable with the path to this file 
COPY ./development/Docker/visualisation/superset_config.py /app/
ENV SUPERSET_CONFIG_PATH /app/superset_config.py

USER superset
# create entry point to start superset when docker container runs
ENTRYPOINT [ "/superset-init.sh" ]