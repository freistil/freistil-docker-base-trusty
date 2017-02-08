#!/bin/bash -e

# Make init scripts executable
chmod +x $(find /docker/bin) $(find /docker -name '*.sh') 
sync

# Execute init scripts
if test -n "$(shopt -s nullglob; echo /docker/init.d/*)"; then
  for initscript in /docker/init.d/*.sh; do
    echo "=> Initialising $initscript"
    $initscript
  done
fi

exec $@
