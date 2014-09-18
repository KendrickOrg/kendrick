tests
testRemoveAVariableFromABinaryExpression
	|e n|
	e := (KEBinaryExpression new op: #*;leftHandSide: (KEVariable new symbol:#S);rightHandSide: (KEMathFunctionExpression new functionName: #cos; functionExpr: (KEVariable new symbol: #t))).
	n := e remove: (KEVariable new symbol: #S).
	self assert: n isExpressionWithMathFunction equals: true.
	self assert: n equals: (KEMathFunctionExpression new functionName: #cos; functionExpr: (KEVariable new symbol: #t)).
	