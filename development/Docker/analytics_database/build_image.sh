# build the custom Postgres image from the dockerfile as follows
# format:  docker build -t <image_name>:<tag> -f <path/to/dockerfile> . 
docker build -t custom-postgres:postgres_instance1 -f development/Docker/analytics_database/Dockerfile .