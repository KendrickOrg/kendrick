tests
testParserFunctionSum
	| tmp1 |
	tmp1 := 'beta=sum(j, beta[i][j]*sum(k, I[k]))' parseAsAnEquation.
	self
		assert: tmp1 expression isExpressionWithSigmaMathFunction
			equals: true;
		assert:
			tmp1 expression functionExpr rightHandSide
				isExpressionWithSigmaMathFunction
			equals: true;
		assert: tmp1 expression idVariable symbol equals: #j