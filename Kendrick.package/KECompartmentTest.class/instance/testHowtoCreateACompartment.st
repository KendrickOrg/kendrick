tests
testHowtoCreateACompartment
	| compartment |
	compartment := KECompartment new
		status: #S;
		numberOfIndividuals: 1 - 1e-6.
	self assert: compartment status equals: #S.
	self assert: compartment numberOfIndividuals equals: 1 - 1e-6