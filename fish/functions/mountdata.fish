function mountdata 
	set opt $argv[1]

	if [ "$opt" = "start" ]
		_mount_data
	else if [ "$opt" = "stop" ]
		_umount_data
	else if [ "$opt" = "startdropbox" ]
		_start_dropbox_process
	else if [ "$opt" = "stopdropbox" ]
		_stop_dropbox_process
	else if  [ "$opt" = "status" ]
		_status_mount
	else
		echo "no valid param informed."
		echo "  options: "
		echo "    start........: mount data dir (if not mounted yet)"
		echo "                   and start dropbox "
		echo "    stop.........: umount data dir (if mounted "
		echo "                   and stop dropbox"
		echo "    startdropbox.: start dropbox (if data is mounted)"
		echo "    stopdropbox..: stop dropbox"
		echo "    status.......: general status"
	end
end

function _mount_data
	if test (mountpoint -q ~/data; echo $status) -eq 0
		echo "data already mounted"
		return 1
	else
		sudo mount /home/daniel/data
		_start_dropbox_process
		echo "==> ~/data" && ls ~/data
		echo "==> ~/Dropbox symlink (to ~/data/Dropbox)" && ls ~/Dropbox
		echo "==> ~/Dropbox/" && ls ~/Dropbox/
		return 0
	end
end

function _umount_data
	if test (mountpoint -q ~/data; echo $status) -eq 0
		_stop_dropbox_process
		sudo umount /home/daniel/data
		return 0
	else
		echo "data already unmounted"
		return 1
	end
end

function _start_dropbox_process
	if test -z (ps -ef | grep -i 'dropbox' | grep -v 'grep')
		nohup ~/.dropbox-dist/dropboxd &
	else
		echo "dropbox already running"
	end
end

function _stop_dropbox_process
	killall dropbox
end

function _status_mount
	if test (mountpoint -q ~/data; echo $status) -eq 0
		echo "[mounted] data is mounted"
	else 
		echo "[unmounted] data is not mounted"
	end

	if test -z (ps -ef | grep -i 'dropbox' | grep -v 'grep')
		echo "[stopped] dropbox is not running"
	else
		echo "[running] dropbox is running"
	end
end

