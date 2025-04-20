FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3.10 \
    python3.10-venv \
    python3.10-distutils \
    curl \
    git


RUN ln -sf /usr/bin/python3.10 /usr/bin/python3 && \
    curl -sS https://bootstrap.pypa.io/get-pip.py | python3

    
RUN pip install PyYAML


COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Make entrypoint executable
RUN chmod +x /entrypoint.sh

# Default workdir for GitHub Actions
WORKDIR /github/workspace

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]
