#!/bin/bash

# Run
redis-server --port 7777 &
python3.9 phpox/sandbox.py &
tanner &
clone --target https://example.com &
snare --port 80 --page-dir example.com --tanner 0.0.0.0

# Keep the container running interactively
exec bash