#!/usr/bin/env zsh

ZSH_CONFIG_DIR="$HOME/.zsh"
SHELL_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/shell"
source "$SHELL_CONFIG_DIR/load" || return

load "$SHELL_CONFIG_DIR/functions"
load "$ZSH_CONFIG_DIR/functions"
load "$SHELL_CONFIG_DIR/aliases"
load "$ZSH_CONFIG_DIR/aliases"
load "$ZSH_CONFIG_DIR/path"
load "$ZSH_CONFIG_DIR/config"
