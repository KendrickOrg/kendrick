as yet unclassified
addCompartment: aSymbol numberOfIndividuals: anObject
	anObject isArray ifTrue: [ 
		compartments := Array new: (anObject size).
		1 to: (anObject size) do: [ :id|
			compartments at: id put: (KECompartment status: aSymbol initialNumberOfIndividuals: (anObject at: id))
			 ].
		populationBuilder buildPopulation: population fromVecteurCompartment: compartments
		 ]
	ifFalse: [ 
		population addSubPopulation: (KECompartment status: aSymbol initialNumberOfIndividuals: anObject)
		 ]
	