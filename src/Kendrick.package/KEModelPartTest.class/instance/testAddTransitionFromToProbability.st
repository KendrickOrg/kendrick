tests-as yet unclassified
testAddTransitionFromToProbability
	| tmp1 |
	tmp1 := KEModelPart new.
	tmp1
		addTransitionFrom: {(#status -> #I)}
		to: {(#status -> #R)}
		probability: 0.5.
	self assert: tmp1 transitions size equals: 1