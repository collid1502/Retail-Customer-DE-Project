# Use the official Apache Airflow image as the base
FROM apache/airflow:2.2.3

# Set environment variables (optional)
# Use these to configure Airflow settings according to needs (these are for dev only, not production) 
ENV AIRFLOW__CORE__EXECUTOR=LocalExecutor
ENV AIRFLOW__CORE__SQL_ALCHEMY_CONN=sqlite:////opt/airflow/airflow.db
ENV AIRFLOW__CORE__LOAD_EXAMPLES=False

# Install additional dependencies or Python packages if needed
USER root
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        vim \
        less \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install any additional Python packages
# RUN pip install --no-cache-dir \
#     apache-airflow-providers-apache-spark

### Not used here as will make use of a virtual environment 

# Add custom DAGs (optional)
# Copy your own DAG files into the container
COPY ./development/Docker/orchestration/dags /opt/airflow/dags

# Switch back to the airflow user for security
USER airflow

# The default command to run when starting the container
# This can be overridden when you run the container if needed
CMD ["airflow", "webserver"]
