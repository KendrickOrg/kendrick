as yet unclassified
exampleOfVectorCompartments
	|compartments vector|
	vector := Array new: 3.
	vector at: 1 put: (KECompartment status: #S initialNumberOfIndividuals: 1000).
	vector at: 2 put: (KECompartment status: #S initialNumberOfIndividuals: 2000).	
	vector at: 3 put: (KECompartment status: #S initialNumberOfIndividuals: 3000).	 
	compartments := Dictionary new.
	compartments at: #S put: vector.
	^ compartments