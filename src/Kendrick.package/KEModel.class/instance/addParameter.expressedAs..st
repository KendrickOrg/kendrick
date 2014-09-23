as yet unclassified
addParameter: aSymbol expressedAs: anEquation
	parameters at: aSymbol put: ((KEParameter new) symbol: aSymbol; expression: anEquation expression) 
	