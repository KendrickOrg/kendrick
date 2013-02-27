as yet unclassified
atCompartment: aStatus putNumberOfIndividuals: aValue

| compartment |
aValue isArray 
	ifTrue: [
		compartment := (KECompartment new) status: aStatus; numberOfIndividuals: aValue; numberOfSpecies: (aValue size); isVector: true.
		] 
	ifFalse: [compartment := (KECompartment new) status: aStatus; numberOfIndividuals: aValue; numberOfSpecies: 1; isVector: false.].
self addCompartment: compartment