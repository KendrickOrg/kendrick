tests
testSeparateABinaryExpression
	| tmp1 tmp2 tmp3 tmp4 tmp5 |
	tmp1 := 's=-(A+B+C)*E*D' parseAsAnEquation.
	tmp2 := 's=-(A+B)*(-C)' parseAsAnEquation.
	tmp3 := 's=(-E)*D*F*(A+B)' parseAsAnEquation.
	tmp4 := 's=(A+B)*(C+D)' parseAsAnEquation.
	self
		assert: 2 equals: tmp2 expression separateExpression size;
		assert: 4 equals: tmp4 expression separateExpression size;
		assert: 3 equals: tmp1 expression separateExpression size;
		assert: 2 equals: tmp3 expression separateExpression size