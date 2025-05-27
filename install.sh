#!/bin/bash

sudo nixos-rebuild switch --flake .#default --impure
sudo nixos-rebuild switch --flake .#fix_nixpkgs --impure
