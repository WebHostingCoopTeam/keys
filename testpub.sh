#!/bin/bash
# test pub file for sanity
# set -e
ISPUBGOOD=$(ssh-keygen -l -f keys 2>&1 |grep -qi "keys is not a public key file" && echo nope)
if [[ -f "keys" && -z "$ISPUBGOOD" ]]
then
  echo "The supplied keys file is good. Proceeding..."
  exit 0
else
  echo "There is an issue with the keys file Exiting."
  exit 1
fi
