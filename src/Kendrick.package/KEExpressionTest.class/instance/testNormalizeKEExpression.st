tests
testNormalizeKEExpression
	| tmp1 tmp2 tmp3 tmp4 tmp5 tmp6 |
	tmp1 := KEBinaryExpression new.
	tmp2 := KEVariable symbol: #S.
	tmp3 := KEVariable new symbol: #beta.
	tmp6 := KEUnaryExpression new op: #-.
	tmp6 expression: tmp2.
	tmp4 := KEUnaryExpression new op: #-.
	tmp4 expression: tmp3.
	tmp1
		op: #*;
		leftHandSide: tmp2;
		rightHandSide: tmp4.
	tmp5 := tmp1 normalize.
	self assert: true equals: tmp5 isUnaryExpression.
	tmp1
		op: #*;
		leftHandSide: tmp6;
		rightHandSide: tmp4.
	tmp5 := tmp1 normalize.
	self assert: false equals: tmp5 isUnaryExpression