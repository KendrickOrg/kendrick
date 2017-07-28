printing
printOn: aStream
	aStream nextPutAll: (self currentStatus) asString, '-->', (self nextStatus) asString
