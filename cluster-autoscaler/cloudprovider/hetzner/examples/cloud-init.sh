#!/usr/bin/env bash
export K3S_URL=https://YOUR_IP:6443
# From /var/lib/rancher/k3s/server/token
export K3S_TOKEN=YOUR_TOKEN
export INSTALL_K3S_CHANNEL=v1.31
EXTERNAL_IP=$(ip -4 addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
INTERNAL_IP=$(ip -4 addr show enp7s0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
curl -sfL https://get.k3s.io | sh -s - --kubelet-arg=cloud-provider=external --node-external-ip $EXTERNAL_IP --node-ip $INTERNAL_IP
