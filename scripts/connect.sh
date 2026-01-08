#!/bin/bash
# Vast.ai Connect Script
# Before running this script, ensure you have already set up your SSH keys in Vast.ai dashboard.

shift 1
export TERM=xterm-256color; ssh -i ~/.ssh/vastai/vastai $@

