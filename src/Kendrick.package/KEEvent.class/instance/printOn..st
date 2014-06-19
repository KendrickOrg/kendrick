accessing
printOn: aStream
	aStream nextPutAll: fromStatus asString, '-->', toStatus asString, ': ', rate asString.