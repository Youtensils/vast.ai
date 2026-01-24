#!/bin/bash
# Runpod Connect Script
# Before running this script, ensure you have already set up your SSH keys in Runpod dashboard.

shift 1
export TERM=xterm-256color; ssh -i ~/.ssh/vastai/vastai $@

