tests
testParserFunctionLog
	|dsdt|
	dsdt := 'S:t=log(2*t)*S' parseAsAnEquation.
	self assert: (dsdt expression leftHandSide isExpressionWithMathFunction) equals: true.
	self assert: (dsdt expression leftHandSide functionName) equals: #log.


