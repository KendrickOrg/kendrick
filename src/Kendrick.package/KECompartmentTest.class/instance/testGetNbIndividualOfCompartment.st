tests
testGetNbIndividualOfCompartment
	| compartment |
	compartment := KECompartment status: #S initialNumberOfIndividuals: 10000.
	
	self assert: (compartment nbOfIndividuals) equals: 10000.
	self assert: (compartment nbOfIndividualsOf: #I) equals: 0