as yet unclassified
addCompartment: aSymbol numberOfIndividuals: anObject
	anObject isArray ifTrue: [ |vector|
		vector := Array new: (anObject size).
		1 to: (anObject size) do: [ :id|
			vector at: id put: (KECompartment status: aSymbol initialNumberOfIndividuals: (anObject at: id))
			 ].
		compartments at: aSymbol put: vector.
		 ]
	ifFalse: [ 
		compartments at: aSymbol put: (KECompartment status: aSymbol initialNumberOfIndividuals: anObject)
		 ]
	
	