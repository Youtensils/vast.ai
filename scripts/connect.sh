#!/bin/bash
# Runpod Connect Script
# Before running this script, ensure you have already set up your SSH keys in Runpod dashboard.

export TERM=xterm-256color; ssh -i ~/.ssh/runpod/runpod $1

