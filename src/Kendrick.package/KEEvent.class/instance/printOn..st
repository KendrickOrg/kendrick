printing
printOn: arg1
	| tmp2 |
	tmp2 := arg1.
	tmp2
		nextPutAll: fromStatus asString;
		nextPutAll: '-->';
		nextPutAll: toStatus asString;
		nextPutAll: ': ';
		nextPutAll: rate asString