tests
testRemoveAVariableFromABinaryExpression
	|e n|
	e := (KEBinaryExpression new op: #*;leftHandSide: (KEVariable new symbol:#S);rightHandSide: (KEExpressionWithMathFunction new functionName: #cos; exprInFunction: (KEVariable new symbol: #t))).
	n := e remove: (KEVariable new symbol: #S).
	self assert: n isExpressionWithMathFunction equals: true.
	self assert: n equals: (KEExpressionWithMathFunction new functionName: #cos; exprInFunction: (KEVariable new symbol: #t)).
	