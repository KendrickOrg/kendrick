tests
testHowtoCreateACompartment
	| compartment |
	compartment := KECompartment status: #S initialNumberOfIndividuals: 1-1e-6.
	
	self assert: compartment status equals: #S.
	self assert: compartment initialNbIndividuals equals: 1-1e-6.
	self assert: compartment currentNbIndividuals equals: 1-1e-6