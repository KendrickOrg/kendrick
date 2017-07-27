tests
testIsUnaryExpression
	| tmp1 tmp2 tmp3 tmp4 |
	tmp1 := KEVariable symbol: #beta.
	tmp2 := KEUnaryExpression new op: #-.
	tmp2 expression: tmp1.
	tmp3 := KEVariable symbol: #S.
	tmp4 := KEBinaryExpression new op: #*.
	tmp4
		rightHandSide: tmp3;
		leftHandSide: tmp1.
	self
		assert: true equals: tmp2 isUnaryExpression;
		assert: false equals: tmp4 isUnaryExpression