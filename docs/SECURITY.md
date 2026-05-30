# Security Architecture

## Layers
1. **Config isolation** - Secrets in .env never in config.yaml
2. **Rate limiting** - 30 req/min per user
3. **Prompt injection** - Input sanitization
4. **Tool output** - Strip ANSI, truncate, sanitize
5. **File access** - Restricted to HERMES_HOME
6. **User allowlist** - Token-level authorization

## Recommended
- Run behind nginx reverse proxy
- Enable Let's Encrypt SSL
- Use Docker for container isolation
- Regular `hermes update`
