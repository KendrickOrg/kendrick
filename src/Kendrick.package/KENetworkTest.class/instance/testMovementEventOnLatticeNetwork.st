tests
testMovementEventOnLatticeNetwork
	|model population graph|
	model := KEModel new.
	population := KEMetaPopulation new.
	population numberOfSubPopulations: 3.
	population forEachSubPopulation: [ :each|
		each compartments: #(S I R).
		each at: #S put: 99; at: #I put: 1; at: #R put: 0.
		KENetwork new: #lattice numberOfContacts: 4 onPopulation: each.
		 ].
	graph := KEGraph on: population.
	graph edges: #((1 2) (1 3)) weight: #beta values: 0.02.
	model population: population.
	model currentPopulationID: #(0 1).
	((model population at: #(0 1)) indList at: 80) nextStatus: #(0 2).
	((model population at: #(0 1)) indList at: 80) updateStatus: model.
	self assert: (model population at: #(0 1)) graph emptyNodes size equals: 1.
	self assert: (model population at: #(0 2)) graph nodes size equals: 101.