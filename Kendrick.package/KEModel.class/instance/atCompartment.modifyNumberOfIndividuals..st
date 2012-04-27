as yet unclassified
atCompartment: aStatus modifyNumberOfIndividuals: aValue

compartments do: [:each|
	each status = aStatus ifTrue:[each numberOfIndividuals: aValue]
	].