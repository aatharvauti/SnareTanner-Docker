#!/bin/bash

# Run
redis-server --port 7777 &
python3.9 phpox/sandbox.py &
tanner &
clone --target https://sakec-admin.netlify.com &

# Keep the container running interactively
exec bash
