# Production Deployment Guide

## Prerequisites
- Linux server (Ubuntu 22.04+ recommended) or macOS
- Python 3.10+
- Domain name (for webhooks)

## Step-by-Step

### 1. Install
```bash
curl -fsSL https://raw.githubusercontent.com/aims1425-lab/hermes-deploy/main/install.sh | bash
```

### 2. Configure
```bash
hermes model        # Pick your provider
hermes config edit  # Adjust settings
```

### 3. Run as Service
```bash
systemctl --user enable hermes-gateway
systemctl --user start hermes-gateway
```

### 4. Reverse Proxy (for webhooks)
See [docs/nginx-example.conf](./nginx-example.conf) for a local reverse proxy example.
