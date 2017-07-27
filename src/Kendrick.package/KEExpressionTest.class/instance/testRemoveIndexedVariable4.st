tests
testRemoveIndexedVariable4
	| tmp1 tmp2 |
	tmp1 := KESigmaFunctionExpression new functionName: #sum.
	tmp1 functionExpr: (KEIndexedVariable new symbol: #S).
	tmp1 functionExpr addIndex: (KEVariable new symbol: #i).
	tmp2 := tmp1 removeIndexedVariable.
	self assert: tmp2 asString equals: 'S'