# Use the official n8n Docker image as the base
FROM n8nio/n8n:latest

# Switch to the root user to install packages
USER root

# Update package lists and install ffmpeg
# The '&& rm -rf /var/lib/apt/lists/*' cleans up to keep the image size small
RUN apt-get update && apt-get install -y ffmpeg && rm -rf /var/lib/apt/lists/*

# Switch back to the non-privileged 'node' user that n8n runs as
USER node
