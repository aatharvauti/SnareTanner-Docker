#!/bin/bash

# Run
redis-server --port 7777 &
python3.9 phpox/sandbox.py &
tanner &
clone --target https://sakec.ac.in --max-depth=1 
snare --port 80 --page-dir sakec.ac.in --tanner 0.0.0.0

# Keep the container running interactively
exec bash