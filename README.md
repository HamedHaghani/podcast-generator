# 🎙️ Podcast RSS Feed Generator by Hamed Haghani 

This GitHub Action automatically generates a podcast RSS feed from a YAML file.  
It is designed to be used in a **separate repo** (e.g., `podcast-test`) that contains your `feed.yaml`.

Use this to automate RSS generation for your podcast and commit the result back to your repository.

---

## 🚀 Features 

- 📥 Reads a `feed.yaml` file
- 📄 Converts it to a standards-compliant RSS feed (`feed.xml`)
- ✅ Automatically commits and pushes the result back to your repo
- 🔄 Can run on every push or as a scheduled job

---

## 📦 Usage

In your own podcast repo (e.g., `podcast-test`), create the following workflow:

```yaml
# .github/workflows/main.yml
name: Generate Podcast Feed

on:
  push:
    paths:
      - feed.yaml

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repo
        uses: actions/checkout@v3

      - name: Generate podcast feed
        uses: HamedHaghani/podcast-generator@v1
        with:
          email: ${{ github.actor }}@users.noreply.github.com
          name: ${{ github.actor }}
