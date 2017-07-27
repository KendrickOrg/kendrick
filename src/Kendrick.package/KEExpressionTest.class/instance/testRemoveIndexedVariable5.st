tests
testRemoveIndexedVariable5
	| tmp1 tmp2 tmp4 |
	tmp1 := KEBinaryExpression new op: #*.
	tmp1 leftHandSide: (KEIndexedVariable new symbol: #S).
	tmp1 leftHandSide addIndex: (KEVariable new symbol: #i).
	tmp1 rightHandSide: (KEIndexedVariable new symbol: #beta).
	tmp4 := KEBinaryExpression new.
	tmp4
		op: #-;
		leftHandSide: (KEVariable new symbol: #i).
	tmp1 rightHandSide
		addIndex: (tmp4 rightHandSide: (KENumerical new number: 1)).
	self assert: tmp1 asString equals: 'S[i]*beta[i-1]'.
	tmp2 := tmp1 removeIndexedVariable.
	self assert: tmp2 asString equals: 'S*beta'