tests
testParserFunctionCos
	| tmp1 tmp2 |
	tmp1 := 'S:t=cos(2*t)' parseAsAnEquation.
	tmp2 := 'I:t=beta*(1+betaAmp*cos(t))' parseAsAnEquation.
	self
		assert: tmp1 expression isExpressionWithMathFunction equals: true;
		assert: tmp1 expression functionName equals: #cos;
		assert:
			tmp2 expression rightHandSide rightHandSide rightHandSide
				isExpressionWithMathFunction
			equals: true;
		assert: tmp2 expression rightHandSide rightHandSide rightHandSide functionName
			equals: #cos