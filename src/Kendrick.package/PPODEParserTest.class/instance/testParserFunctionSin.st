tests
testParserFunctionSin
	| tmp1 |
	tmp1 := 'S:t=beta*S*I + sin(2*t)' parseAsAnEquation.
	self
		assert: tmp1 expression rightHandSide isExpressionWithMathFunction
			equals: true;
		assert: tmp1 expression rightHandSide functionName equals: #sin