as yet unclassified
atCompartment: aStatus putNumberOfIndividuals: aValue
	| compartment anArray |
	aValue isArray 
		ifTrue: [anArray := aValue] 
		ifFalse: [anArray := Array new: 1.
				   anArray at: 1 put: aValue].
	compartment := (KECompartment new) status: aStatus; numberOfIndividuals: anArray; numberOfSpecies: (anArray size); initialValue: anArray.
self addCompartment: compartment