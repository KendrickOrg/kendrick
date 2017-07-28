tests
testAnEmpyModelHasNoTransitions
	| model |
	model := KEModel new.
	self assert: model transitions size equals: 0