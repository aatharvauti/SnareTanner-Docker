#!/bin/bash

# Run
redis-server --port 7777 &
python3.9 phpox/sandbox.py &
tanner &
clone --target https://sakec-admin.netlify.com &
snare --port 80 --page-dir sakec-admin.netlify.com --tanner 0.0.0.0 --host-ip 0.0.0.0

# Keep the container running interactively
exec bash