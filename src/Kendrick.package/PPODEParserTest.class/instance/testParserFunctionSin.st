tests
testParserFunctionSin
	|dsdt|
	dsdt := 'S:t=beta*S*I + sin(2*t)' parseAsAnEquation.
	self assert: (dsdt expression rightHandSide isMathExpression) equals: true.
	self assert: (dsdt expression rightHandSide function) equals: #sin