tests
testParserAnExpression
	| tmp1 |
	tmp1 := 'exp(-d^2)' parseAsAnExpression.
	self
		assert: tmp1 isExpressionWithMathFunction equals: true;
		assert: tmp1 functionName equals: #exp;
		assert: tmp1 functionExpr isBinaryExpression equals: true