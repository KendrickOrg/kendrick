tests
testRemoveAVariableFromANumber
	|e n|
	e := (KENumerical new number: 200).
	n := e remove: (KEVariable new symbol: #S).
	self assert: n equals: (KENumerical new number: 200).
	