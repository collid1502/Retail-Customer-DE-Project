# Setting up the machine to run the process on 

This docker image will be based around an AWS Linux machine. <br>
It will install Conda & Spark (plus dependencies), creating a specified virtual environment for this development project. This environment will be used as the core of the ETL process to be built as part of the development project.

### Details 

To create the custom Docker Image from the Dockerfile, you can execute:

```
# ensure you are in the root dir of this project before executing below command 
docker build -t server_instance:server_master1 -f development/Docker/server/Dockerfile .
```

This will then run a build of the docker image, providing it the name `server_instance` and giving it a tag `server_master1`.

You can then view your Docker Images by running:

```
docker images
```

You should see the `hello-world` image which comes as standard following the docker installation process, then you will also see the `server_instance` image, with it's respective tag.

When running this image as part of a network later, use the folder path `development/Docker/server/mounted_files` as the mounted volume for the container