testing
printOn: aStream
	aStream nextPutAll: functionName asString, '(', idVariable asString, ',', functionExpr asString, ')'.