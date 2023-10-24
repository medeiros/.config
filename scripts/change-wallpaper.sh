#!/bin/sh
# This file lives at `~/.config/scripts/change-wallpaper.sh`
# Sets background wallpaper of X display :0 to a random JPG file chosen from
# the directory `~/.config/wallpapers`
DISPLAY=:0 feh --no-fehbg --bg-fill --randomize ~/.config/wallpapers/1920x1080/*.jpg
