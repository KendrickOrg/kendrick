as yet unclassified
atCompartment: aStatus numberOfSpecies: nbSpecies
"Use this method in the case of large number of host, ex: 100"
| compartment |
	compartment := (KECompartment new) status: aStatus; numberOfIndividuals: nil; numberOfSpecies: nbSpecies.
	self addCompartment: compartment