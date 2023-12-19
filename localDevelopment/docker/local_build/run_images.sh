# run docker images with mounts in place 
# -it is for interactive
docker run -p 8888:8888 -it -v /home/collid/work/projects/data_engineering/customprojects/retailCompany_de_cloud/localDevelopment/docker/local_build/data:/app/data local_aws_instance:latest
