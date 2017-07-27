tests
testParserExpressionOfIndexOfIndexedVariable
	| tmp1 tmp2 tmp3 |
	tmp1 := 'S:t=-beta*S*I[i+1]' parseAsAnEquation.
	tmp2 := 'I:t=beta*S*I[cos(t)]' parseAsAnEquation.
	tmp3 := 'R:t=gamma*I[i]' parseAsAnEquation.
	self
		assert: tmp1 expression rightHandSide isAnIndexedVariable
			equals: true;
		assert: tmp2 expression rightHandSide isAnIndexedVariable
			equals: true;
		assert: tmp3 expression rightHandSide isAnIndexedVariable
			equals: true;
		assert: (tmp1 expression rightHandSide atIndex: 1) isBinaryExpression
			equals: true;
		assert:
			(tmp2 expression rightHandSide atIndex: 1)
				isExpressionWithMathFunction
			equals: true;
		assert: (tmp3 expression rightHandSide atIndex: 1) isAVariable
			equals: true