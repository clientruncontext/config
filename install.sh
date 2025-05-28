#!/bin/bash

mkdir -p $HOME/Pictures
mkdir -p $HOME/Pictures/Screenshots
mkdir -p $HOME/Downloads
mkdir -p $HOME/Desktop
mkdir -p $HOME/Documents
mkdir -p $HOME/Projects

sudo nixos-rebuild switch --flake .#default --impure
sudo nixos-rebuild switch --flake .#fix_nixpkgs --impure
