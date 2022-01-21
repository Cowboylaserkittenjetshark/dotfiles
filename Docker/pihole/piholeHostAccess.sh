#!/bin/bash
# Setup bridge to allow host system to acces Pi-hole in Docker container.
# Run as a systemd service at startup.
ip link add pihole link enp34s0 type macvlan mode bridge
ip addr add 192.168.0.200/32 dev pihole
ip link set pihole up
ip route add 192.168.0.199/32 dev pihole
