as yet unclassified
sizeOfCompartment: associations
	^ self population compartments at: associations ifAbsent: [ ^ self error: 'No compartment name: ', associations asString ]
	
	
	
	