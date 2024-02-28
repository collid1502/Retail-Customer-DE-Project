# Docker

Utilising docker to spin-up the resources required for the different components of an end to end project.<br>
This allows for local development on one EC2 machine (or laptop) without having to service a variety of different tools when simply wanting to develop a concept.

It also may open the possibility of simply running all these services via K8s in the cloud (AWS) anyway.

### Checking Docker's status on the machine

Check if the service is already running with

```
sudo systemctl status docker
```

If not, start it:

```
sudo systemctl start docker
```

And should you need to stop it:

```
sudo systemctl stop docker
```


-----------------------
-----------------------

### Details 

This project development will spin up:

- A server for running the application code 
- An Apache Airflow instance as an orchestration & scheduling tool
- A Postgres instance for the analytical database to store results of ETL
- Apache Superset as an open-source tool for data visualisation from the Postgres Analytical Database

#### Images 
As part of the learning for this project, custom images will be created, via dockerfiles in each respective sub-dir<br>
<br>
There is a `build_image.sh` file in each which will create the custom image & tag. 

These customer images can the be viewed in the local Docker Directory like so:

```
# view images 
docker images
```

and if you wish to remove any, you could use:
```
# specify the image id (from list above) to remove 
docker rmi 7982a7edfb50

# or you can also use it's repository & tag
```

#### Containers

Searching for Docker containers, including stopped ones:
```
docker ps -a
```

To remove a container, use:
```
# docker rm [container_id]
docker rm 866f862b6bd4
```

or, to remove all stopped conatiners, use:
```
docker container prune
```

------------------------------------------------

#### Running the images as container to test 

If you wanted to run an image, as a container to test and play around with, you could do:

```
# run docker images with mounts in place 
# -it is for interactive
docker run -p 8888:8888 -it -v ./development/Docker/server/mounted_area:/app/data server_instance:server_master1
```

The above, runs the `server_instance` image, which has tag `server_master1` and it specifies it as available on port 8888 through the `-p` option. The `-it` is for interactive mode, and `-v` creates a volume between storage on the local machine, to a location inside the docker container. That way, anything created in the conatiner, is replicated to actual storage & persisted even if the container is stopped.

Execute the above, and it should open an interactive shell based on a AWS Linux 2 machine

You should see that a virtual conda environment has automatically activated too, as we enabled that within the image setup.<br>
use 
```
conda list
```
to see all the python packages in the environment.

you can exit the container with:
```
exit
```

if you were not in interactive mode, you could stop the container with:
```
# pattern: docker stop <container_id_or_name>
docker stop <container_id_or_name>
docker stop c26a8e45cbf5
```

and of course, if you wanted, you could remove it. <br>

Equally, you could restart it & go back in ...
```
# restart it 
docker start c26a8e45cbf5

# attach back in to it
docker attach c26a8e45cbf5
```

This should bring you back into the shell of that container<br>
You can then exit/stop as needed

#### How about testing the postgres container? And connecting to it from the Cloud 9 EC2 machine

add some details here about starting container ...
add soem details on data volume storage for DB ... 


connection from machine by:

```
PGPASSWORD=postgres_password psql -h localhost -p 5432 -U admin_postgres -d retail_analytics
```

**Never store actual passwords etc. in open files / git**