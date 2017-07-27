tests
testPrintABinaryExpression
	| tmp1 tmp2 tmp3 |
	tmp1 := KEBinaryExpression new.
	tmp2 := KENumerical number: 3.
	tmp3 := KENumerical number: 4.
	tmp1
		op: #+;
		leftHandSide: tmp2;
		rightHandSide: tmp3.
	self assert: '3+4' equals: tmp1 asString