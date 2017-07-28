printing
printOn: aStream
	aStream 
		nextPutAll: '-';
		nextPutAll: expression asString