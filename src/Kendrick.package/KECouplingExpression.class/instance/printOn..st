acessing
printOn: aStream
	aStream 
		nextPutAll: 'sum(j, ', self couplingExpression asString, ')'