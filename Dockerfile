# Use a Debian base image
FROM debian:stable-slim

# Install necessary packages for Wine
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y wine32 wget xvfb

# Create a directory for REXPaint
RUN mkdir -p /rexpaint
WORKDIR /rexpaint

# Copy local REXPaint files into the Docker image
COPY /Users/gs/repos/rexpaint/REXPaint-v1.70 /rexpaint

# Expose the display port for Xvfb
EXPOSE 5901

# Start Xvfb
CMD ["sh", "-c", "Xvfb :1 -screen 0 1024x768x16 & bash"]