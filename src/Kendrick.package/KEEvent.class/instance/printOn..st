printing
printOn: aStream
	aStream
		nextPutAll: fromStatus asString;
		nextPutAll: '-->';
		nextPutAll: toStatus asString;
		nextPutAll: ': ';
		nextPutAll: rate asString