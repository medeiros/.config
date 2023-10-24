function tmux_layout_mysite_kill

	set session s0
	set session_name (tmux ls -F "#{session_name}" 2>/dev/null | grep "^$session\$" )

	set window1 mysite
	set window2 cmd

	if ! test -z $session_name
		tmux switch -t 0
		tmux kill-window -t $session:$window2
		tmux kill-window -t $session:$window1
	else
		return 0
	end

end

