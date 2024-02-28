# Use the official PostgreSQL image as the base image
FROM postgres:latest

# Set environment variables
ENV POSTGRES_DB=retail_analytics
ENV POSTGRES_USER=admin_postgres
ENV POSTGRES_PASSWORD=postgres_password

# Optional: Add custom initialization scripts
# COPY ./init.sql /docker-entrypoint-initdb.d/

# The base image's default CMD will start PostgreSQL with the specified environment variables