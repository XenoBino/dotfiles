vimstat() {
	VIMs="$(ps -A | sed -nE "/vim/s/^([0-9]+).*/\1/gp")"

	for pid in $VIMs; do
		echo $pid
		cat /proc/$pid/status | grep "VmSize"
		echo "--------"
	done
}

t() {
	if [ "$1" == "" ];
	then
		exa -bhT --sort=Name --group-directories-first -L 2
	else
		exa -bhT --sort=Name --group-directories-first -L $@
	fi
}

swap-file() {
	if [ "$#" lt "2" ];
	then
		echo "Usage: swap <file1> <file2>";
		return
	fi

	tmpfile=$(mktemp $(dirname "$1")/XXXXXX)
	mv "$1" "$tmpfile" && mv "$2" "$1" &&  mv "$tmpfile" "$2"
}

r() {
	clear && fastfetch
}

cols() {
	echo "Width: $COLUMNS Columns"
}
