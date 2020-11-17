#!/bin/zsh

# @see https://stackoverflow.com/questions/11685135/how-to-get-parent-folder-of-executing-script-in-zsh
SCRIPT_SOURCE=${0%/*}

zsh "${SCRIPT_SOURCE}"/dev_down.zsh;
zsh "${SCRIPT_SOURCE}"/dev_build.zsh;
zsh "${SCRIPT_SOURCE}"/dev_run.zsh;
