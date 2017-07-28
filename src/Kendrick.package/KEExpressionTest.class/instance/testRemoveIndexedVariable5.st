tests
testRemoveIndexedVariable5
	|e n|
	e := KEBinaryExpression new op: #*.
	e leftHandSide: (KEIndexedVariable new symbol: #S).
	e leftHandSide addIndex: (KEVariable new symbol: #i).
	e rightHandSide: (KEIndexedVariable new symbol: #beta).
	e rightHandSide addIndex: (KEBinaryExpression new op: #-;leftHandSide: (KEVariable new symbol: #i); rightHandSide: (KENumerical new number: 1)).
	self assert: e asString equals: 'S[i]*beta[i-1]'.
	n := e removeIndexedVariable.
	self assert: n asString equals: 'S*beta'.
	
	
	