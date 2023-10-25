function tmux_layout_mysite

	if test -z (findmnt /home/daniel/data|head -1)
		echo data device not mounted
		return 0
	end

	set session s0
	set session_name (tmux ls -F "#{session_name}" 2>/dev/null | grep "^$session\$" )

	set window1 mysite
	set window1path "~/data/code/opensource/medeiros.github.io"
	set window2 cmd

	if test -z $session_name
		tmux $TMUX_OPTS new-session -s s0 -d -n $window1
		#tmux new-window -a -t $session -n $window1 
		tmux split-window -t $session:$window1
		tmux resize-pane -t $session:$window1.1 -y 20%
		tmux send-keys -t $session:$window1.0 "nvim" Enter
		tmux send-keys -t $session:$window1.1 "cd $window1path; git status" Enter

		tmux new-window -a -t $session -n $window2
		tmux send-keys -t $session:$window2 "cmatrix -s" Enter

		tmux switch -t $session:$window1.0
	else
		tmux $TMUX_OPTS attach -t s0
		tmux switch -t $session
		return 0
	end

end

