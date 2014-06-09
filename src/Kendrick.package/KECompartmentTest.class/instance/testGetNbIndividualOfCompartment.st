tests
testGetNbIndividualOfCompartment
	| compartment |
	compartment := KECompartment status: #S initialNumberOfIndividuals: 10000.
	
	self assert: (compartment getNbIndividuals) equals: 10000.
	self assert: (compartment getNbIndividualsOfCompartment: #I) equals: 0