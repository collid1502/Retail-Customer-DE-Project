# Dockerfiles

##### EXTRA notes
```
COPY instance_python/environment.yml /root/environment.yml
```
##### having copied the `environment.yml` file that should be sitting in the same dir as this dockerfile
##### now execute the creation of a conda environment 
```
RUN conda create -n $CONDA_ENV_NAME -f /root/environment.yml
```
##### or you can use the requirements.txt file approach
```
COPY instance_python/requirements.txt /root/requirements.txt
```
##### now execute the creation of a conda environment 
```
RUN conda create --name $CONDA_ENV_NAME --file /root/requirements.txt
```