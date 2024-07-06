#!/bin/bash

# Delete the key and certificate if they exist
[ -e server.key ] && rm server.key
[ -e server.crt ] && rm server.crt

# Generate a private key
openssl genrsa -out server.key 2048

# Generate a self-signed certificate
openssl req -new -x509 -key server.key -out server.crt -days 365 -subj /CN=localhost