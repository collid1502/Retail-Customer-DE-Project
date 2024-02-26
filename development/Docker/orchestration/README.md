# Orchestration

Here, Apache Airflow will be set-up via Docker. It will be used to create a DAG that can process the tasks inside the overall process of this pipeline being developed.

### Details 

To create the custom Docker Image from the Dockerfile, you can execute:

```
# ensure you are in the root dir of this project before executing below command 
docker build -t custom-airflow:airflow_instance1 -f development/Docker/orchestration/Dockerfile .
```

This will then run a build of the docker image, providing it the name `custom-airflow` and giving it a tag `airflow_instance1`.

You can then view your Docker Images by running:

```
docker images
```

You should see the `hello-world` image which comes as standard following the docker installation process, then you will also see the `custom-airflow` image, with it's respective tag.