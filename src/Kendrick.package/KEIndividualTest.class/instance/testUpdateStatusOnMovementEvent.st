tests
testUpdateStatusOnMovementEvent
	|model population|
	model := KEModel new.
	population := KEMetaPopulation new.
	population numberOfSubPopulations: 5.
	population forEachSubPopulation: [ :each|
		each compartments: #(S I).
		each at: #S put: 1000; at: #I put: 0.
		 ].
	model population: population.
	model currentPopulationID: #(0 1).
	((model population at: #(0 1)) indList at: 80) nextStatus: #(0 2).
	((model population at: #(0 1)) indList at: 80) updateStatus: model.
	self assert: ((model population at: #(0 2)) at: #S) currentNbIndividuals equals: 1001.
	self assert: ((model population at: #(0 1)) at: #S) currentNbIndividuals equals: 999.

	