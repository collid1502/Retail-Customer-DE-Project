# build the Airflow image from the dockerfile as follows
# format:  docker build -t <image_name>:<tag> -f <path/to/dockerfile> . 
docker build -t custom-airflow:airflow_instance1 -f development/Docker/orchestration/Dockerfile .