function slay
	kill -9 $(lsof -ti:$argv)
end