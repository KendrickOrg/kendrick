tests
testSizeOfEachCompartmentSizeOfSIRModel
	| model |
	model := KEModel new population: (KEPopulation size: 100000).
	model attributes: {(#status -> #(#S #I #R))}.
	model atCompartment: {(#status -> #S)} put: 99999 atOthersPut: 0.
	model atCompartment: {(#status -> #I)} put: 1.
	self assert: (model sizeOfPopulation: #(#S)) equals: 99999.
	self assert: (model sizeOfPopulation: #(#I)) equals: 1.
	self assert: (model sizeOfPopulation: #(#R)) equals: 0