grammar
multiplication
	^ power separatedBy: ($* asParser / $/ asParser) token trim
	