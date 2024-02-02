# To list all containers, including those that are stopped, use the command:
docker ps -a

# You can format the output of docker ps to show specific information. For example:
docker ps --format "{{.ID}}: {{.Image}} ({{.Names}})"

# Stop Unnecessary Containers: Use the Docker CLI or Docker Desktop to stop containers that you are not actively using. 
# You can stop a container using the command:
docker stop <container-name-or-id>
 
# Filter Containers: You can filter the list of containers based on conditions like status, name, label, etc. For example, to list containers with a specific status:
docker ps --filter "status=exited"


# Remove Unused Containers: To remove stopped containers, you can use the command:
docker rm <container-name-or-id>

# Or to remove all stopped containers:
docker container prune

# Check Docker Compose Usage: If using Docker Compose, ensure you shut down your environments with docker-compose down to avoid leaving orphaned containers.
# Refresh Remote Explorer: Sometimes, refreshing the Remote Explorer view can update and clear out any containers that are no longer running.