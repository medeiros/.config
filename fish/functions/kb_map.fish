function kb_map
    set kbmap $argv[1]
	
    if [ "$kbmap" = "us" ]
        _apply us intl
    else if [ "$kbmap" = "br" ]
        _apply br abnt2
    else
        echo "invalid param. options: us|br"
    end
end

function _apply
    set layout $argv[1]
    set variant $argv[2]
	
    setxkbmap -model pc105 -layout $layout -variant $variant

    echo -n "kb_map set.........: "; _print model; _print layout; \
	    _print variant; echo ' '
end

function _print
    echo -n $argv[1]: (setxkbmap -print -verbose 10 | grep -i $argv[1] \
	    | tr -s ' ' | cut -d ' ' -f2)
    echo -n '; '
end


