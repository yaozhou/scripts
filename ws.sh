#!/bin/sh

cd ~/web_static
nvm use v9.2.0
nohup ws -z -p 8000 &
