as yet unclassified
addCompartment: aSymbol numberOfElements: aNumber
	compartmentSymbols at: aSymbol put: true.
	compartmentAsVector := Array new: aNumber.
	1 to: aNumber do: [ :id|
		compartmentAsVector at: id put: (KECompartment status: aSymbol initialNumberOfIndividuals: 0)
		 ]
	