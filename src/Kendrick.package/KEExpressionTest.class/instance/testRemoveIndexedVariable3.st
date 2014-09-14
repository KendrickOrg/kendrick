tests
testRemoveIndexedVariable3
	|e f n|
	e := (KEExpressionWithMathFunction new functionName: #cos).
	e exprInFunction: (KEVariable new symbol: #t).
	f := e copy.
	f exprInFunction: (KEIndexedVariable new symbol: #S).
	f exprInFunction addIndex: (KEVariable new symbol: #i).
	n := e removeIndexedVariable.
	self assert: n asString equals: 'cos(t)'.
	self assert: f asString equals: 'cos(S[i])'.
	self assert: f removeIndexedVariable asString equals: 'cos(S)'.
	
	