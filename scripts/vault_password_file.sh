#!/bin/zsh

LABEL="ansible-vault-password"

ACCOUNT_NAME="connected-house"

/usr/bin/security find-generic-password -w -a "$ACCOUNT_NAME" -l "$LABEL"
