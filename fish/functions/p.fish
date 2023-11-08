function p
	if test -z (findmnt /home/daniel/data|head -1)
		echo data device not mounted
		return 0
        end

	cat ~/data/material/contas | grep -i $argv[1] --binary-files=text
end



