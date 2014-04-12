tests
testParserExpressionOfIndexOfIndexedVariable
	|dsdt didt drdt|
	dsdt := 'S:t=-beta*S*I[i+1]' parseAsAnEquation.
	didt := 'I:t=beta*S*I[cos(t)]' parseAsAnEquation.
	drdt := 'R:t=gamma*I[i]' parseAsAnEquation.
	self assert: (dsdt expression rightHandSide isAnIndexedVariable) equals: true.
	self assert: (didt expression rightHandSide isAnIndexedVariable) equals: true.
	self assert: (drdt expression rightHandSide isAnIndexedVariable) equals: true.
	self assert: ((dsdt expression rightHandSide atIndex: 1) isBinaryExpression ) equals: true.
	self assert: ((didt expression rightHandSide atIndex: 1) isExpressionWithMathFunction) equals: true.
	self assert: ((drdt expression rightHandSide atIndex: 1) isAVariable) equals: true


