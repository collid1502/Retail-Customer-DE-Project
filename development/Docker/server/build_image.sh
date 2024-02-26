# this will build the image for our local development server, based on the Dockerfile in this sub-dir

## ----- NOTES ------------------------------------------------------------------------------------------
# "-t" option tags the resulting image with a name
# "-f" option specifies the path to the relevant dockerfile
# --no-cache ensures a clean, new build at run time
# "." at the end represents the build context, which is the current directory

# AWS Linux 2 instance with Spark & Miniconda (virtual Python Env created & Jupyter installed)
# format:  docker build -t <image_name>:<tag> -f <path/to/dockerfile> . 
docker build -t server_instance:server_master1 -f development/Docker/server/Dockerfile .