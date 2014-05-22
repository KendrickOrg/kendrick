tests
testParserFunctionExp
	|dsdt|
	dsdt := 'S:t=exp(2*t)' parseAsAnEquation.
	self assert: (dsdt expression isExpressionWithMathFunction) equals: true.
	self assert: (dsdt expression functionName) equals: #exp.




