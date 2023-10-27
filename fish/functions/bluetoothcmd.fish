function bluetoothcmd
    set opt $argv[1]

    if [ "$opt" = "1" ]
	    _reload_pa_modules
    else if [ "$opt" = "2" ]
	    _show_current_bluetooth_sources
    else if [ "$opt" = "3" ] 
	    _redirect_pa_to_wf1000xm3
    else if [ "$opt" = "4" ] 
	    _redirect_pa_to_wh1000xm3
    else if [ "$opt" = "5" ]
	    _help_bluetoothctl
    else 
        echo "no valid param informed." 
	echo "  options: "
	echo "    1 - unload/load pulse audio modules"
	echo "    2 - show current bluetooth sources"
	echo "    3 - set default source/sink to WF-1000XM3"
	echo "    4 - set default source/sink to WH-1000XM3"
	echo "    5 - show help for connect with bluetoothctl"
    end
end

function _reload_pa_modules
    # in /etc/pulse/default.pa - make sure that the following modules are set
    pacmd unload-module module-bluetooth-discover \
    	    && pacmd load-module module-bluetooth-discover
    pacmd unload-module module-bluetooth-policy \
    	    && pacmd load-module module-bluetooth-policy
end

function _show_current_bluetooth_sources
    echo (pacmd list-sources | grep -e 'index:' -e device.string -e 'name:' -e \
	    'available' | grep -i bluez -C1)
end

function _redirect_pa_to_wf1000xm3
    # redirect publiseaudio to bluettooth headset
    pactl set-default-source bluez_sink.14_3F_A6_DD_47_8C.a2dp_sink.monitor
    pactl set-default-sink bluez_sink.14_3F_A6_DD_47_8C.a2dp_sink
end

function _redirect_pa_to_wh1000xm3
    echo not implemented
    return 127
end

function _help_bluetoothctl
    echo ' '
    echo 'usage: '
    echo '-------'
    echo 'bluettoothctl'
    echo '> power on'
    echo '> agent on'
    echo '> devices (must find headset; scan on/off otherwise)'
    echo 'first time:'
    echo ' > scan on (wait for device to show)'
    echo ' > pair <mac addr>'
    echo ' > trust <mac addr>'
    echo ' > connect <mac addr>' 
    echo ' '
end


