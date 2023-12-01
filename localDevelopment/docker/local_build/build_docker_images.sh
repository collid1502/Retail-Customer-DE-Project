# specify the paths to the relevant dockerfiles
# we can now build some custom docker images to use 

#======================================================================
### WARNING ###
# ensure this code is being ran from within the 
# `./localDevelopment/docker/local_build` directory of this whole project
#======================================================================

# "-t" option tags the resulting image with a name
# "-f" option specifies the path to the relevant dockerfile
# --no-cache ensures a clean, new build at run time
# "." at the end represents the build context, which is the current directory

## 1 - AWS Linux 2 instance with Spark & Miniconda (virtual Python Env created & Jupyter installed)
docker build -t local_aws_instance:latest -f instance_python/dockerfile .

