as yet unclassified
printOn: aStream
	aStream nextPutAll: functionName asString, '(', exprInFunction asString, ')'.