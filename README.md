# Docker Compose files for `proteus` server

These are mounted in `/var/mnt/data/Deployments` and started via the following
systemd service unit (`/etc/systemd/system/docker-compose@.service`):

```ini
[Unit]
Description=%i service with docker compose
Requires=docker.service
After=docker.service

[Service]
Type=oneshot
RemainAfterExit=true
WorkingDirectory=/var/mnt/data/Deployments/%i
ExecStart=/usr/bin/docker compose up -d --remove-orphans
ExecStop=/usr/bin/docker compose down
TimeoutStartSec=5m

[Install]
WantedBy=multi-user.target
```
