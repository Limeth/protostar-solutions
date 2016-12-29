#!/bin/bash
# This script encodes a hexadecimal value into a little-endian string
input="$@"

# Remove whitespace from the input
input="$(echo -e "${input}" | tr -d '[:space:]')"

# Hex-dump
printf "$input" | xxd -r -p
