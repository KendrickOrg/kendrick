as yet unclassified
sizeOfACompartment: aCompartmentName
	^ self compartments at: aCompartmentName ifAbsent: [ ^ self error: 'No compartment name: ', aCompartmentName asString ]
	
	
	
	