function multihead
    xrandr --output eDP-1 --auto --output HDMI-1 --auto --right-of eDP-1
    echo 'multihead set.: output eDP-1; output HDMI-1 right-of eDP-1 \
	    (see: xrandr -q)'
end

