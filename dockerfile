# Use an official Python runtime as a parent image
FROM python:3.11.8-slim-bookworm

# Set the working directory in the container
WORKDIR /app

# Install Kaggle CLI
RUN pip install kaggle

# Copy the download script into the container
COPY download_data.sh /app/download_data.sh

# Make sure the script is executable
RUN chmod +x /app/download_data.sh

# Use an entrypoint script to dynamically configure Kaggle API credentials
ENTRYPOINT ["/app/download_data.sh"]