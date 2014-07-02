tests
testParserFunctionSin
	|dsdt|
	dsdt := 'S:t=beta*S*I + sin(2*t)' parseAsAnEquation.
	self assert: (dsdt expression rightHandSide isExpressionWithMathFunction) equals: true.
	self assert: (dsdt expression rightHandSide functionName) equals: #sin