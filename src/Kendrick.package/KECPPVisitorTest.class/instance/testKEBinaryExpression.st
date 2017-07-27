as yet unclassified
testKEBinaryExpression
	| tmp1 tmp2 tmp3 tmp4 tmp5 |
	tmp1 := KEBinaryExpression new.
	tmp3 := KENumerical new.
	tmp3 number: 3.
	tmp4 := KENumerical new.
	tmp4 number: 7.
	tmp5 := #+.
	tmp1
		op: tmp5;
		leftHandSide: tmp3;
		rightHandSide: tmp4.
	tmp2 := KECPPVisitor new visitNode: tmp1.
	self assert: tmp2 contents = '(3+7)'