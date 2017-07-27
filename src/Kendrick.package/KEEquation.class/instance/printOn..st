printing
printOn: arg1
	| tmp2 |
	tmp2 := arg1.
	tmp2
		nextPutAll: variable asString;
		nextPutAll: ':';
		nextPutAll: tVariable asString;
		nextPutAll: '=';
		nextPutAll: expression asString