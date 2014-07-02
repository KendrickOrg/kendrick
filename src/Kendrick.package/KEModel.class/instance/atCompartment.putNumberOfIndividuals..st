as yet unclassified
atCompartment: aStatus putNumberOfIndividuals: aValue
	| compartment anArray |
	aValue isArray 
		ifTrue: [anArray := aValue] 
		ifFalse: [anArray := Array new: 1.
				 anArray at: 1 put: aValue].
	compartment := (KECompartment new) status: aStatus; numberOfIndividuals: anArray; numberOfSpecies: (anArray size).
	compartment initialValue: (Array new: (anArray size)).
	1 to: (anArray size) do: [:id|compartment initialValue at: id put: (anArray at: id)].
self addCompartment: compartment