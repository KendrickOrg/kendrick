tests
testCheckHasVariableInAnUnaryExpression
	| tmp1 tmp2 tmp4 tmp6 |
	tmp1 := self createADictionaryForTest.
	tmp4 := KEUnaryExpression new.
	tmp4 op: #-.
	tmp6 := KEBinaryExpression new.
	tmp6
		op: #*;
		leftHandSide: (KEVariable new symbol: #beta).
	tmp2 := tmp4
		expression: (tmp6 rightHandSide: (KEVariable new symbol: #S)).
	self assert: (tmp2 checkHasVariable: tmp1) equals: true