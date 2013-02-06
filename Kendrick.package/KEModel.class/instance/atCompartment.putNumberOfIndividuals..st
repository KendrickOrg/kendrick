as yet unclassified
atCompartment: aStatus putNumberOfIndividuals: aValue
	| compartment |
	compartment := KECompartment new
		status: aStatus;
		numberOfIndividuals: aValue.
	self addCompartment: compartment