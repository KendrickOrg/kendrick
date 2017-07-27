printing
printOn: arg1
	| tmp2 |
	tmp2 := arg1.
	tmp2
		nextPutAll: '-';
		nextPutAll: expression asString