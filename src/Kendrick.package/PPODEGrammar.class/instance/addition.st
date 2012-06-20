grammar
addition
	^ factors separatedBy: ($+ asParser / $- asParser) token trim