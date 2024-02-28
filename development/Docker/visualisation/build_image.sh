# this will build the image for our apache superset, based on the Dockerfile in this sub-dir

## ----- NOTES ------------------------------------------------------------------------------------------
# "-t" option tags the resulting image with a name
# "-f" option specifies the path to the relevant dockerfile
# --no-cache ensures a clean, new build at run time
# "." at the end represents the build context, which is the current directory

# format:  docker build -t <image_name>:<tag> -f <path/to/dockerfile> . 
docker build -t superset_master:superset_m1 -f development/Docker/visualisation/Dockerfile .