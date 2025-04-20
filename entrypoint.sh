name: "Podcast Generator"
description: "Generates a feed for a podcast from a YAML file"
author: "Hamed Haghani"

inputs:
  email:
    description: "The committer's email address"
    required: true
    default: ${{ github.actor }}@users.noreply.github.com
  name:
    description: "The committer's name"
    required: true
    default: ${{ github.actor }}

runs:
  using: "docker"
  image: "Dockerfile"
