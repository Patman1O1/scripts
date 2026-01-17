#!/usr/bin/env bash

set -euo pipefail

# Define parameters
REAL_NAME="${1:-}"
EMAIL="${2:-}"
PASSPHRASE="${3:-}"

# Make sure arguments are passed to required parameters
if [[ $# -lt 2 ]]; then
    echo "Usage:"
    echo "  $0 <real_name> <email> [<passphrase>]"
    exit 1
fi

if [[ -z "$PASSPHRASE" ]]; then
    cat > gpg-batch.conf <<EOF
Key-Type: eddsa
Key-Curve: ed25519
Subkey-Type: ecdh
Subkey-Curve: cv25519
Name-Real: $REAL_NAME
Name-Email: $EMAIL
Expire-Date: never
%no-ask-passphrase
%no-protection
%commit
EOF
else
    cat > gpg-batch.conf <<EOF
Key-Type: eddsa
Key-Curve: ed25519
Subkey-Type: ecdh
Subkey-Curve: cv25519
Name-Real: $REAL_NAME
Name-Email: $EMAIL
Expire-Date: never
Passphrase $PASSPHRASE
EOF
fi

gpg --batch --generate-key gpg-batch.conf

