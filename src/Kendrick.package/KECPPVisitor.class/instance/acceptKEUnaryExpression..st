as yet unclassified
acceptKEUnaryExpression: arg1
	| tmp1 |
	tmp1 := WriteStream on: (String new: 60).
	tmp1
		nextPutAll: '(';
		nextPutAll: arg1 op;
		nextPutAll: (self visitNode: arg1 expression);
		nextPutAll: ')'.
	^ tmp1 contents