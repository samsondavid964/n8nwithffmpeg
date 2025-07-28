# Use the official n8n image as the base
FROM n8nio/n8n:latest

# Switch to the root user to install packages
USER root

# Install FFmpeg and other necessary tools using apk (for Alpine Linux)
RUN apk add --no-cache ffmpeg curl wget && \
    rm -rf /var/cache/apk/*

# Switch back to the n8n user for security best practices
USER node

# You can optionally add other n8n environment variables here if you prefer
# ENV N8N_ENCRYPTION_KEY=your_secure_encryption_key
# ENV DB_TYPE=postgresdb
# ENV DB_POSTGRESDB_HOST=your_db_host
# ENV DB_POSTGRESDB_DATABASE=your_db_name
# ENV DB_POSTGRESDB_USER=your_db_user
# ENV DB_POSTGRESDB_PASSWORD=your_db_password

# Expose the default n8n port (Render will handle mapping)
EXPOSE 5678

# The default command from the base n8n image will be used
