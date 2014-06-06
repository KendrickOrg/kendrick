accessing
printOn: aStream
	aStream nextPutAll: status asString,'-->', currentNbIndividuals asString 