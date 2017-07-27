tests
testRemoveAVariableFromAVariable
	| tmp1 tmp2 |
	tmp1 := KEVariable new symbol: #S.
	tmp2 := tmp1 remove: (KEVariable new symbol: #S).
	self assert: tmp2 equals: nil