alias cmd='command'
alias ls='ls -lthr --color'
alias lse='ls | grep'
alias pyup='myip; python -m SimpleHTTPServer 8008;'
#nmap -sn 192.168.1.0/24
alias rzoom="kill $(ps -eaf | grep /opt/zoom/zoom | grep -vE 'grep|home' | awk '{ print $2 }') ; /usr/bin/zoom &"
myip()
{
	ip=$(ifconfig | grep inet | grep -E 'broad|Bcast' | awk '{print $2}' | sed 's/.*://' | tail -1 )
	echo $ip
}
export myip


nmaps()
{
	nmap_input=$(myip | sed 's/\./ /g' | awk 'NF{NF-=1};1' | sed 's/ /\./g' | sed 's/$/\.0\/24/' )
	#echo $nmap_input
	nmap -sn $nmap_input
	
}
export nmaps

amenu()
{
	echo ""
	echo "Aliases"
	echo "cmd=  Run a command without any alias (short for command)"
	echo "ls=   List files in a list with details, soerted by time"
	echo "lse=  List files then grep on results"
	echo "pyup= Start http server at current directory with python on port 8008 (get ip with myip)"
	echo "Functions"
	echo "myip= Display current ip"
}
export amenu

ahelp()
{
	# To contain usefule commands
	echo ""
	echo "Find a binary (example code):    command -v code"
}
export ahelp
#Store details here
#ls -lthr --color
#	l use long listing format (with details)
#	t sort by modification time, newest first
#	h human redable sizes
#	r reserves order while sorting (thus making oldest first if used with t)
echo "Welcome!"
echo "Use amenu to see list of available options :)"
