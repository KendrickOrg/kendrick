as yet unclassified
printOn: aStream
	aStream nextPutAll: fromStatus name asString, '-->', toStatus name asString, ':', compartment asString, ':', rate asString