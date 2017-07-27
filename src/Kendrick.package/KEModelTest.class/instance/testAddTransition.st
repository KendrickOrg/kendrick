tests
testAddTransition
	| tmp1 |
	tmp1 := KEModel new.
	tmp1
		addTransition:
			(KETransition
				from: '{#status: #S}'
				to: '{#status: #I}'
				probability: 'beta*I' parseAsAnExpression).
	self assert: tmp1 transitions size equals: 1