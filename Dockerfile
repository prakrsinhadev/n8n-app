# STAGE 1: Extract FFmpeg and FFprobe binaries
# We use this image because it contains "static" versions of the tools 
# that work on any Linux distribution without extra dependencies.
FROM mwader/static-ffmpeg:latest AS ffmpeg-source

# STAGE 2: Build the n8n image
FROM n8nio/n8n:latest

# Switch to root to allow file copying and permission changes
USER root

# Copy the binaries from the first stage into the system path
COPY --from=ffmpeg-source /ffmpeg /usr/local/bin/ffmpeg
COPY --from=ffmpeg-source /ffprobe /usr/local/bin/ffprobe

# Ensure the binaries have the correct execution permissions
RUN chmod +x /usr/local/bin/ffmpeg /usr/local/bin/ffprobe

# Switch back to the 'node' user for security (n8n's default user)
USER node