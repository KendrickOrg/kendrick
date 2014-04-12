as yet unclassified
exampleOfVectorCompartments
	|compartments|
	compartments := Array new: 3.
	compartments at: 1 put: (KECompartment status: #S initialNumberOfIndividuals: 1000).
	compartments at: 2 put: (KECompartment status: #S initialNumberOfIndividuals: 2000).	
	compartments at: 3 put: (KECompartment status: #S initialNumberOfIndividuals: 3000).	 
	
	^ compartments