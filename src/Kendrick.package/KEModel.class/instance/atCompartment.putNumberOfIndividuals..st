as yet unclassified
atCompartment: aStatus putNumberOfIndividuals: aValue

| compartment |
compartment := (KECompartment new) status: aStatus; numberOfIndividuals: aValue; numberOfSpecies: 1; isVector: false.
self addCompartment: compartment