function sshdmz () { 
	if [[ -z $# ]]
	then
		echo "needs ip"
		return 0
	fi
	ssh "192.168.0.$1"
}
