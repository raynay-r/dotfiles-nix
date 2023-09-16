#! /bin/sh

export NIX_SSHOPTS="-i /home/rene/.ssh/vbox -p 2222 -X"
nixos-rebuild --target-host rene@localhost --build-host rene@localhost --use-remote-sudo switch --upgrade-all --flake '.#home-vbox'
