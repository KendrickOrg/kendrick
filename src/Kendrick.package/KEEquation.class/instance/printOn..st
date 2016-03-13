printing
printOn: aStream
	aStream
		nextPutAll: variable asString;
		nextPutAll: ':';
		nextPutAll: tVariable asString;
		nextPutAll: '=';
		nextPutAll: expression asString