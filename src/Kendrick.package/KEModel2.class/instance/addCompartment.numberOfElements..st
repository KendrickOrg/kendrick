as yet unclassified
addCompartment: aSymbol numberOfElements: aNumber
	compartments := Array new: aNumber.
	1 to: aNumber do: [ :id|
		compartments at: id put: (KECompartment status: aSymbol initialNumberOfIndividuals: 0)
		 ]
	