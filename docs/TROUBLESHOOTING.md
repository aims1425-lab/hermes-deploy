# Troubleshooting

## Gateway won't start
```bash
# Check logs
journalctl --user -u hermes-gateway -n 50 --no-pager

# Verify config
hermes config show

# Port conflict
lsof -i :8644
```

## Bot not responding
1. Check token: `grep TELEGRAM_BOT_TOKEN .env`
2. Check logs for "polling conflict"
3. Kill stale processes: `pkill -f "hermes.*gateway"`

## Rate limited
- Wait 60 seconds
- Check `security.rate_limit` in config
- Increase or disable for testing
