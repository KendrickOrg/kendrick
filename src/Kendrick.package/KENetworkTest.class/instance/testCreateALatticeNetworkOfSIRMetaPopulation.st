tests
testCreateALatticeNetworkOfSIRMetaPopulation
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
	
	self assert: (model population graph nodes size) equals: 3.
	self assert: (model population at: 1) graph nodes size equals: 100 