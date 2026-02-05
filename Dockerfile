FROM n8nio/n8n:latest

USER root
RUN apk update && apk add --no-cache ffmpeg
USER node

FROM n8nio/n8n:latest

USER root

# Install ffmpeg and common utils
RUN apk update && \
    apk add --no-cache ffmpeg && \
    apk cache clean

# Switch back to node user (important for security)
USER node
