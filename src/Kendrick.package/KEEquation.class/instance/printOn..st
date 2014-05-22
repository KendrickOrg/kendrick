accessing
printOn: aStream
	aStream nextPutAll: (variable asString), ':', tVariable asString, '=', expression asString
	