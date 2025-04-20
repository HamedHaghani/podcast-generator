# Use a lightweight Python image to avoid apt install issues
FROM python:3.10-slim

# Install git and clean up to reduce image size
RUN apt-get update && apt-get install -y git && apt-get clean

# Install PyYAML for parsing YAML files
RUN pip install PyYAML

# Copy your script and entrypoint into the container
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Ensure entrypoint is executable
RUN chmod +x /entrypoint.sh

# Optional: Set working directory if needed
WORKDIR /github/workspace

# Set entrypoint to run your script
ENTRYPOINT ["/entrypoint.sh"]
