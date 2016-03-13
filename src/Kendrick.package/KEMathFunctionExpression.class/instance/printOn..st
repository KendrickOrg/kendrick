printing
printOn: aStream
	aStream nextPutAll: functionName asString, '(', functionExpr asString, ')'.