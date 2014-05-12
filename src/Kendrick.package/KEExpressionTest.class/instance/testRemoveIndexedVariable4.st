tests
testRemoveIndexedVariable4
	|e n|
	e := (KEExpressionWithSigmaMathFunction new functionName: #sum).
	e exprInFunction: (KEIndexedVariable new symbol: #S).
	e exprInFunction addIndex: (KEVariable new symbol: #i).
	n := e removeIndexedVariable.
	self assert: n asString equals: 'S'.
	
	
	