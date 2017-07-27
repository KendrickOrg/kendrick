tests
testParserFunctionExp
	| tmp1 |
	tmp1 := 'S:t=exp(2*t)' parseAsAnEquation.
	self
		assert: tmp1 expression isExpressionWithMathFunction equals: true;
		assert: tmp1 expression functionName equals: #exp