tests
testCheckHasVariableInASigmaMathFunctionExpression
	| tmp1 tmp2 tmp4 tmp6 |
	tmp1 := self createADictionaryForTest.
	tmp4 := KESigmaFunctionExpression new.
	tmp4 functionName: #sigma.
	tmp6 := KEBinaryExpression new.
	tmp6
		op: #*;
		leftHandSide: (KEVariable new symbol: #beta).
	tmp2 := tmp4
		functionExpr: (tmp6 rightHandSide: (KEIndexedVariable new symbol: #S)).
	self assert: (tmp2 checkHasVariable: tmp1) equals: true