as yet unclassified
sizeOfACompartment: arg1
	^ self compartments
		at: arg1
		ifAbsent: [ ^ self error: 'No compartment name: ' , arg1 asString ]