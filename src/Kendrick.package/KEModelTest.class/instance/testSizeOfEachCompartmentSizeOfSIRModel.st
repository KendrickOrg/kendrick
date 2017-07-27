tests
testSizeOfEachCompartmentSizeOfSIRModel
	| tmp1 |
	tmp1 := KEModel new population: (KEPopulation size: 100000).
	tmp1
		attributes: {(#status -> #(#S #I #R))};
		atCompartment: {(#status -> #S)} put: 99999 atOthersPut: 0;
		atCompartment: {(#status -> #I)} put: 1.
	self
		assert: (tmp1 sizeOfPopulation: #(#S)) equals: 99999;
		assert: (tmp1 sizeOfPopulation: #(#I)) equals: 1;
		assert: (tmp1 sizeOfPopulation: #(#R)) equals: 0