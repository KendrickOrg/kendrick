accessing
printOn: aStream
	aStream nextPutAll: symbol asString, ' = '.
	expression ifNotNil: [ aStream nextPutAll: expression asString ].
	value ifNotNil: [ aStream nextPutAll: value asString ]