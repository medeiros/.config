function fish_greeting
	set cowsay_options (cowsay -l | tail +2 | tr -d '\n' | string split ' ')
	set random_idx (random 1 (count $cowsay_options))
	fortune -e computers startrek linux | \
		cowsay -f $cowsay_options[$random_idx]
end

