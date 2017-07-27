tests
testRemoveAVariableFromABinaryExpression
	| tmp1 tmp2 tmp4 tmp6 tmp8 |
	tmp4 := KEBinaryExpression new.
	tmp4
		op: #*;
		leftHandSide: (KEVariable new symbol: #S).
	tmp6 := KEMathFunctionExpression new.
	tmp6 functionName: #cos.
	tmp1 := tmp4
		rightHandSide: (tmp6 functionExpr: (KEVariable new symbol: #t)).
	tmp2 := tmp1 remove: (KEVariable new symbol: #S).
	self assert: tmp2 isExpressionWithMathFunction equals: true.
	tmp8 := KEMathFunctionExpression new.
	tmp8 functionName: #cos.
	self
		assert: tmp2
		equals: (tmp8 functionExpr: (KEVariable new symbol: #t))