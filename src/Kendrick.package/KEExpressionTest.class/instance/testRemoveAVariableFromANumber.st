tests
testRemoveAVariableFromANumber
	| tmp1 tmp2 |
	tmp1 := KENumerical new number: 200.
	tmp2 := tmp1 remove: (KEVariable new symbol: #S).
	self assert: tmp2 equals: (KENumerical new number: 200)