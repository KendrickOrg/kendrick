tests
testKEModelWith1Compartment
	| model |
	model := KEModel new.
	model atCompartment: #S putNumberOfIndividuals: 1 - 1e6.
	self assert: model numberOfCompartments equals: 1