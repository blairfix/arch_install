#!/bin/bash

sudo systemctl enable tailscale.service
sudo systemctl start tailscale.service

tailscale up
