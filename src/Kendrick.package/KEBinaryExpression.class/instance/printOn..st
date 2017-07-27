printing
printOn: arg1
	| tmp2 |
	tmp2 := arg1.
	tmp2
		nextPutAll: leftHandSide asString;
		nextPutAll: op asString;
		nextPutAll: rightHandSide asString