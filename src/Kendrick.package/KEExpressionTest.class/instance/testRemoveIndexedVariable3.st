tests
testRemoveIndexedVariable3
	|e f n|
	e := (KEMathFunctionExpression new functionName: #cos).
	e functionExpr: (KEVariable new symbol: #t).
	f := e copy.
	f functionExpr: (KEIndexedVariable new symbol: #S).
	f functionExpr addIndex: (KEVariable new symbol: #i).
	n := e removeIndexedVariable.
	self assert: n asString equals: 'cos(t)'.
	self assert: f asString equals: 'cos(S[i])'.
	self assert: f removeIndexedVariable asString equals: 'cos(S)'.
	
	