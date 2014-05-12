tests
testKEModelWith1Compartment
	|model|
	model := KEModel2 new.
	model population compartments: #((S 100000)).
	self assert: 1 equals: model population getNbSubPopulations.
	self assert: 100000 equals: (model population at: #S) currentNbIndividuals.