accessing
addParameter: aSymbol value: value
	parameters ifNil: [ parameters := Dictionary new ].
	parameters at: aSymbol put: value
	