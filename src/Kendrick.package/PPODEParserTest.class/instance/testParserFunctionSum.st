tests
testParserFunctionSum
	|dsdt|
	dsdt := 'beta=sum(j, beta[i][j]*sum(k, I[k]))' parseAsAnEquation.
	self assert: (dsdt expression) isExpressionWithSigmaMathFunction equals: true.
	self assert: (dsdt expression exprInFunction rightHandSide) isExpressionWithSigmaMathFunction equals: true.
	self assert: (dsdt expression idVariable symbol) equals: #j