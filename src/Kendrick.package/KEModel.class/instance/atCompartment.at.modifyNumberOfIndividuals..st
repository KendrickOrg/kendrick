as yet unclassified
atCompartment: aStatus at: idSpecie modifyNumberOfIndividuals: aValue

compartments do: [:each|
	each status = aStatus ifTrue:[
		(each numberOfIndividuals) at: idSpecie put: aValue.
		]
	]