tests
testRemoveIndexedVariable4
	|e n|
	e := (KESigmaFunctionExpression new functionName: #sum).
	e functionExpr: (KEIndexedVariable new symbol: #S).
	e functionExpr addIndex: (KEVariable new symbol: #i).
	n := e removeIndexedVariable.
	self assert: n asString equals: 'S'.
	
	
	