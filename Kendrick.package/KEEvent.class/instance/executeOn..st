as yet unclassified
executeOn: aModel
	|  old |
	actions keysAndValuesDo:[:status :modification |
		old := ((aModel atCompartment: (status symbol)) numberOfIndividuals) at: (self eqIndex).
		aModel atCompartment: (status symbol) at: (self eqIndex) modifyNumberOfIndividuals: (old + modification).
		]
	
