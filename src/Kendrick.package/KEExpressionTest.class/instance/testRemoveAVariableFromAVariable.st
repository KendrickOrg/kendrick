tests
testRemoveAVariableFromAVariable
	|e n|
	e := (KEVariable new symbol: #S).
	n := e remove: (KEVariable new symbol: #S).
	self assert: n equals: nil.
	