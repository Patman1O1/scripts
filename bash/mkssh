#!/usr/bin/env bash

set -euo pipefail

KEYNAME="${1:-}"
EMAIL="${2:-}"
PASSPHRASE="${3:-}"

# Ensure arguments are passed to required parameters
if [[ $# -lt 2 ]]; then
    echo "Usage:"
    echo "$0 <keyname> <email> [<passphrase>]"
    exit 1
fi

# Make sure ~/.ssh exists with the correct permissions
mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"

# Go to ~/.ssh
cd "$HOME/.ssh"

# Check if the SSH key pair already exists
if [[ -f "$HOME/.ssh/$KEYNAME" && -f "$HOME/.ssh/$KEYNAME.pub" ]]; then
    # Make sure the both the public and private key files have the correct permissions
    chmod 700 "$HOME/.ssh"
    chmod 700 "$HOME/.ssh/$KEYNAME.pub"
    chmod 600 "$HOME/.ssh/$KEYNAME"
    
    # Let the user know the SSH key pair already exists
    echo "SSH key \"$KEYNAME\" already exists"
    exit 1
fi
rm -f "$KEYNAME" || rm -f "$KEYNAME.pub"

# Generate the SSH key pair
ssh-keygen -t ed25519 -C "$EMAIL" -f "$KEYNAME" -N "$PASSPHRASE"

