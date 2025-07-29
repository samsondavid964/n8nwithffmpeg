# Use the official n8n image as the base
FROM n8nio/n8n:latest

# Switch to root to install system-level packages
USER root

# Install Tesseract OCR, FFmpeg, Python, pip, and build dependencies
RUN apk add --no-cache \
    tesseract-ocr \
    tesseract-ocr-data-eng \
    ffmpeg \
    python3 \
    py3-pip \
    build-base \
    leptonica \
    && pip3 install --no-cache-dir pytesseract Pillow

# Clean up to reduce image size
RUN rm -rf /var/cache/apk/*

# Switch back to the n8n user for security best practices
USER node

# Expose the default n8n port
EXPOSE 5678
