tests
testModelWithTwoCompartmentsOfSizeNineAneOneHasATotalSizeOfTen
	| tmp1 |
	tmp1 := KEModel new population: (KEPopulation size: 10).
	tmp1
		attributes: {(#status -> #(#S #I #R))};
		atCompartment: {(#status -> #S)} put: 9;
		atCompartment: {(#status -> #I)} put: 1;
		atCompartment: {(#status -> #R)} put: 0.
	self assert: tmp1 population size equals: 10