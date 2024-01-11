#! /bin/sh

export NIX_SSHOPTS="-i /home/rene/.ssh/openforge -X"
nixos-rebuild --target-host root@192.168.10.110 --build-host root@192.168.10.110 --use-remote-sudo switch --upgrade-all --flake '.#nixos-tuxedo'
