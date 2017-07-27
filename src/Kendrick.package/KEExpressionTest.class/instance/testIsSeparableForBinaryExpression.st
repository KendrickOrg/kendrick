tests
testIsSeparableForBinaryExpression
	| tmp1 tmp2 tmp3 tmp4 tmp5 |
	tmp1 := 's=-(A+B+C)*E*D' parseAsAnEquation.
	tmp2 := 's=-(A+B)*(-C)' parseAsAnEquation.
	tmp3 := 's=(-E)*D*F*(A+B)' parseAsAnEquation.
	tmp4 := 's=-A*B' parseAsAnEquation.
	tmp5 := 's=(A+B)*(C+D)' parseAsAnEquation.
	self
		assert: true equals: tmp1 expression isSeparable;
		assert: true equals: tmp2 expression isSeparable;
		assert: true equals: tmp3 expression isSeparable;
		assert: false equals: tmp4 expression isSeparable;
		assert: true equals: tmp5 expression isSeparable