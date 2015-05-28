as yet unclassified
sizeOfCompartment: associations
	^ self compartments at: associations ifAbsent: [ ^ self error: 'No compartment name: ', associations asString ]
	
	
	
	