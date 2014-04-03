tests
testParserExpressionOfIndexOfIndexedVariable
	|dsdt didt drdt|
	dsdt := 'S:t=-beta*S*I[i+1]' parseAsAnEquation.
	didt := 'I:t=beta*S*I[cos(t)]' parseAsAnEquation.
	drdt := 'R:t=gamma*I[i]' parseAsAnEquation.
	self assert: (dsdt expression rightHandSide isAnIndexedVariable) equals: true.
	self assert: (didt expression rightHandSide isAnIndexedVariable) equals: true.
	self assert: (drdt expression rightHandSide isAnIndexedVariable) equals: true.
	self assert: (dsdt expression rightHandSide idExpression1 isBinaryExpression ) equals: true.
	self assert: (didt expression rightHandSide idExpression1 isMathExpression) equals: true.
	self assert: (drdt expression rightHandSide idExpression1 isAVariable) equals: true


