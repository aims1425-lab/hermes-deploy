# Hermes Deploy 🚀

**Production-ready Hermes Agent deployment template.**  
Go from `pip install` to a secure, production-grade agent in minutes.

```bash
curl -fsSL https://raw.githubusercontent.com/aims1425-lab/hermes-deploy/main/install.sh | bash
```

## Features

- ⚡ **One-command setup** — installs Hermes, configures providers, connects Telegram
- 🔒 **Security by default** — hardened config, rate limiting, prompt injection guards
- 🐳 **Docker Compose** — isolated gateway, optional postgres, health checks
- 📱 **Telegram + Discord ready** — pre-configured platforms, just add tokens
- 🔄 **Auto-restart** — systemd user services, crash recovery, cron maintenance
- 🌐 **Multi-provider** — OpenAI, Anthropic, DeepSeek, Nous Portal, local models
- 📊 **Health monitoring** — prometheus endpoint, uptime checks, log rotation
- 🧩 **Skill management** — bundled essential skills, easy custom skill import

## Quick Start

```bash
# 1. One command install
curl -fsSL https://raw.githubusercontent.com/aims1425-lab/hermes-deploy/main/install.sh | bash

# 2. Configure your provider
hermes model

# 3. Start chatting
hermes chat
```

### Docker (recommended for production)

```bash
git clone https://github.com/aims1425-lab/hermes-deploy.git
cd hermes-deploy
cp .env.example .env
# Edit .env with your tokens
docker compose up -d
```

## What You Get

### Directory Structure

```
hermes-deploy/
├── docker-compose.yml      # Container orchestration
├── config.yaml             # Hermes production configuration
├── .env.example            # All secrets (copy to .env)
├── install.sh              # Automated server setup
├── scripts/
│   ├── health-check.sh     # Gateway health monitoring
│   ├── backup.sh           # Daily config + memory backups
│   └── rotate-logs.sh      # Log rotation and cleanup
├── security/
│   ├── hardening.sh        # Server hardening script
│   └── audit.sh            # Security audit checklist
└── docs/
    ├── PRODUCTION.md        # Production deployment guide
    ├── SECURITY.md          # Security architecture
    └── TROUBLESHOOTING.md   # Common issues
```

### Security Hardening

| Feature | Default | Production |
|---------|---------|------------|
| Prompt injection guard | ❌ | ✅ |
| Rate limiting | ❌ | ✅ |
| Tool output sanitization | ❌ | ✅ |
| Allowed user IDs | ❌ | ✅ |
| Environment isolation | ❌ | ✅ |
| Log rotation | ❌ | ✅ |
| Health endpoint | ❌ | ✅ |

## Configuration

```yaml
# config.yaml (production template)
model:
  default: gpt-4o
  provider: openai

gateway:
  port: 8644
  host: 127.0.0.1
  allowed_user_ids: ["your_telegram_id"]

security:
  rate_limit: 30/minute
  max_turns: 50
  sanitize_tool_output: true

platforms:
  telegram:
    enabled: true
    bot_token: "${TELEGRAM_BOT_TOKEN}"
```

## Deployment Options

| Option | Use Case |
|--------|----------|
| **Docker** (recommended) | Production, isolation, easy updates |
| **Direct install** | Development, single-user |
| **Systemd service** | 24/7 always-on server |
| **Docker + reverse proxy** | Multi-agent, SSL, webhooks |

## Contributing

PRs welcome! See [CONTRIBUTING.md](CONTRIBUTING.md).

## Credits

Built on [Hermes Agent](https://github.com/NousResearch/hermes-agent) by Nous Research.  
This template distills production experience from deploying Hermes in real-world SaaS environments.

## License

MIT
