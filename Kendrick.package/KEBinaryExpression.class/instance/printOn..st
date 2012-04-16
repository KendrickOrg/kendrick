as yet unclassified
printOn: aStream
	aStream 
		nextPutAll: leftHandSide asString;
		nextPutAll: op asString;
		nextPutAll: rightHandSide asString