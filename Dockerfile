FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
  python3.10 \
  python3-pip \
  python3-venv \
  git \
  && apt-get clean

# Create virtual environment
RUN python3 -m venv /opt/venv

# Activate virtual environment and install packages
ENV PATH="/opt/venv/bin:$PATH"

RUN pip install --upgrade pip
RUN pip install PyYAML

# Copy app files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
