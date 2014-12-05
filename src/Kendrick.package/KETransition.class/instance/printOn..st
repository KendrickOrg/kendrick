accessing
printOn: aStream
	rate ifNotNil: [ aStream nextPutAll: rate asString ].
	rate ifNil: [ aStream nextPutAll: probability asString ]