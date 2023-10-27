function set_current_workmode
    _margin
    if [ (xrandr -q | grep ' connected' | wc -l) = 2 ]
        _detected_workmode 'home'
        _prefix; multihead
        _prefix; kb_map 'us'
    else
        _detected_workmode 'remote'
        _prefix; echo 'single monitor set'
        _prefix; kb_map 'br'
    end
    _margin
end	

function _margin
    echo ' '
end

function _detected_workmode
    echo "[$(date +'%Y-%m-%d %H:%M:%S' )]: Detected work mode: $argv[1]" 
end 

function _prefix
    echo -n '   - '
end

