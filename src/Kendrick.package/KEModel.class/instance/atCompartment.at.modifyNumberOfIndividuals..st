as yet unclassified
atCompartment: aStatus at: idSpecies modifyNumberOfIndividuals: aValue

compartments do: [:each|
	each status = aStatus ifTrue:[
		(each numberOfIndividuals) at: idSpecies put: aValue.
		]
	]