as yet unclassified
addCompartment: aSymbol numberOfElements: aNumber
	|vector|
	vector := Array new: aNumber.
	1 to: aNumber do: [ :id|
		vector at: id put: (KECompartment status: aSymbol initialNumberOfIndividuals: 0)
		 ].
	compartments at: aSymbol put: vector
	