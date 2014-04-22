as yet unclassified
addCompartment: aSymbol numberOfIndividuals: anObject
	compartmentSymbols at: aSymbol put: true.
	anObject isArray ifTrue: [ 
		compartmentAsVector := Array new: (anObject size).
		1 to: (anObject size) do: [ :id|
			compartmentAsVector at: id put: (KECompartment status: aSymbol initialNumberOfIndividuals: (anObject at: id))
			 ].
		populationBuilder buildPopulation: population fromVecteurCompartment: compartmentAsVector
		 ]
	ifFalse: [ 
		population addSubPopulation: (KECompartment status: aSymbol initialNumberOfIndividuals: anObject)
		 ]
	
	