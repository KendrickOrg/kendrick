printing
printOn: aStream
	aStream
		nextPutAll: functionName asString;
		nextPutAll: '(';
		nextPutAll: idVariable asString;
		nextPutAll: ',';
		nextPutAll: functionExpr asString;
		nextPutAll: ')'