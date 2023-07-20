#!/bin/sh
set -ex

layout=$(yabai -m query --spaces --space | jq -r .type)

case $layout in
	"bsp") next="stack";;
	"stack") next="float";;
	"float") next="bsp";;
esac

yabai -m space --layout $next
