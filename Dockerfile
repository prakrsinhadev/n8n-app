FROM n8nio/n8n:latest

USER root

# Install ffmpeg using Debian's package manager (apt)
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg && \
    rm -rf /var/lib/apt/lists/*

# Switch back to the node user for security
USER node