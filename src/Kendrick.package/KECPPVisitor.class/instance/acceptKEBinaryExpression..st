as yet unclassified
acceptKEBinaryExpression: arg1
	| tmp1 |
	tmp1 := WriteStream on: (String new: 60).
	tmp1
		nextPutAll: '(';
		nextPutAll: (self visitNode: arg1 leftHandSide);
		nextPutAll: arg1 op;
		nextPutAll: (self visitNode: arg1 rightHandSide);
		nextPutAll: ')'.
	^ tmp1 contents