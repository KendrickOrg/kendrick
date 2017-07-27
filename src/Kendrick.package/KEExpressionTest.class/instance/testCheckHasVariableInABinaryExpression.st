tests
testCheckHasVariableInABinaryExpression
	| tmp1 tmp2 tmp4 |
	tmp1 := self createADictionaryForTest.
	tmp4 := KEBinaryExpression new.
	tmp4
		op: #+;
		leftHandSide: (KEVariable new symbol: #beta).
	tmp2 := tmp4 rightHandSide: (KEVariable new symbol: #I).
	self assert: (tmp2 checkHasVariable: tmp1) equals: true