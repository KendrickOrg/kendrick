as yet unclassified
addEquation: anEquation
	compartmentSymbols at: anEquation variable symbol put: true.
	equations addLast: anEquation