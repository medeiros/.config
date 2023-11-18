function backup_data
	set exclude_list {'**/cache','**/Cache','**/.cache','**/.Cache','**/.config/BraveSoftware','**/.config/Slack','**/.config/chromium','**/Dropbox'} 
	
	set backup_device /dev/sdb42

	set data_dir /home/daniel/data
	set backup_dir /home/daniel/databkp

	sudo mount $backup_device $backup_dir
	
	rsync -avzh --info=progress2 --info=name0 --exclude=$exclude_list $data_dir $backup_dir
	rsync -avzh --info=progress2 --info=name0 /etc/fstab $backup_dir/etc/
end
