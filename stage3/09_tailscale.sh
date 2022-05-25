#!/bin/bash

sudo systemctl enable tailscaled.service
sudo systemctl start tailscaled.service

sudo tailscale up
