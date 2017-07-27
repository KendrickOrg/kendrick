tests
testRemoveIndexedVariable3
	| tmp1 tmp2 tmp3 |
	tmp1 := KEMathFunctionExpression new functionName: #cos.
	tmp1 functionExpr: (KEVariable new symbol: #t).
	tmp2 := tmp1 copy.
	tmp2 functionExpr: (KEIndexedVariable new symbol: #S).
	tmp2 functionExpr addIndex: (KEVariable new symbol: #i).
	tmp3 := tmp1 removeIndexedVariable.
	self
		assert: tmp3 asString equals: 'cos(t)';
		assert: tmp2 asString equals: 'cos(S[i])';
		assert: tmp2 removeIndexedVariable asString equals: 'cos(S)'