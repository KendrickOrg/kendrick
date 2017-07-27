tests
testParserFunctionLog
	| tmp1 |
	tmp1 := 'S:t=log(2*t)*S' parseAsAnEquation.
	self
		assert: tmp1 expression leftHandSide isExpressionWithMathFunction
			equals: true;
		assert: tmp1 expression leftHandSide functionName equals: #log