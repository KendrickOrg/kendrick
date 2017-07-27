tests
testBuildABinaryExpression
	| tmp1 tmp2 tmp3 tmp4 |
	tmp1 := KEBinaryExpression new.
	tmp2 := KENumerical new.
	tmp2 number: 3.
	tmp3 := KENumerical new.
	tmp3 number: 7.
	tmp4 := #+.
	tmp1
		op: tmp4;
		leftHandSide: tmp2;
		rightHandSide: tmp3.
	self assert: tmp1 op equals: #+