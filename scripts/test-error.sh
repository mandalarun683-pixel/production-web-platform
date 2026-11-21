#!/bin/bash

set -e

trap 'echo "ERROR: A command failed!"' ERR

echo "Testing error handling..."

false

echo "This message should not appear."
