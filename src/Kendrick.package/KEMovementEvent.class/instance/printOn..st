as yet unclassified
printOn: aStream
	aStream nextPutAll: fromStatus asString, '-->', toStatus asString, ':', compartment asString, ':', rate asString