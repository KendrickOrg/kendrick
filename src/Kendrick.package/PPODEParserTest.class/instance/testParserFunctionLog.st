tests
testParserFunctionLog
	|dsdt|
	dsdt := 'S:t=log(2*t)*S' parseAsAnEquation.
	self assert: (dsdt expression leftHandSide isMathExpression) equals: true.
	self assert: (dsdt expression leftHandSide function) equals: #log.


