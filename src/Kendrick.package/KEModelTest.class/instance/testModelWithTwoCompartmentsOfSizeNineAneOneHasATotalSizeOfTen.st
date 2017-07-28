tests
testModelWithTwoCompartmentsOfSizeNineAneOneHasATotalSizeOfTen
	| model |
	model := KEModel new population: (KEPopulation size: 10).
	model attributes: {(#status -> #(#S #I #R))}.
	model atCompartment: {(#status -> #S)} put: 9.
	model atCompartment: {(#status -> #I)} put: 1.
	model atCompartment: {(#status -> #R)} put: 0.
	self assert: model population size equals: 10