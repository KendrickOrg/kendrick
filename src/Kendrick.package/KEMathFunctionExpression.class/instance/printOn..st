printing
printOn: arg1
	| tmp2 |
	tmp2 := arg1.
	tmp2
		nextPutAll: functionName asString;
		nextPutAll: '(';
		nextPutAll: functionExpr asString;
		nextPutAll: ')'