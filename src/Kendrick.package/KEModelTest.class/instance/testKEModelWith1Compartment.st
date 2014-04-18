tests
testKEModelWith1Compartment
	|model|
	model := KEModel2 new.
	model addCompartment: #S numberOfIndividuals: 1-1e6.
	self assert: 1 equals: model population getNbSubPopulations.
	self assert: 1-1e6 equals: (model population atSubPopulation: #S) currentNbIndividuals.