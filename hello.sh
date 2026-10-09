#!/bin/sh
printf '\033c\033]0;%s\a' Platformer
base_path="$(dirname "$(realpath "$0")")"
"$base_path/hello.x86_64" "$@"
