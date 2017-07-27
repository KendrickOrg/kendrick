tests
testAnEmpyModelHasNoTransitions
	| tmp1 |
	tmp1 := KEModel new.
	self assert: tmp1 transitions size equals: 0