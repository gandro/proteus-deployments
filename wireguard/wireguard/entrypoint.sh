#!/bin/sh
cmd() {
    echo "[#] $*" >&2
    "$@"
}

set -o errexit
IFACE=${1:-wg0}

wg-quick up "${IFACE}"

cmd iptables -A FORWARD -i "${IFACE}" -j ACCEPT
cmd iptables -A FORWARD -o "${IFACE}" -j ACCEPT
cmd iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

sleep infinity