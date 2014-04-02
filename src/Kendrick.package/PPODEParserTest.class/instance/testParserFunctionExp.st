tests
testParserFunctionExp
	|dsdt|
	dsdt := 'S:t=exp(2*t)' parseAsAnEquation.
	self assert: (dsdt expression isMathExpression) equals: true.
	self assert: (dsdt expression function) equals: #exp.




