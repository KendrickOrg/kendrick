tests
testCreateASpatialNetworkOfSIRPopulation
	|model population|
	model := KEModel new.
	population := KEMetaPopulation new.
	population compartments: #(S I R).
	population at: #S put: 100; at: #I put: 0; at: #R put: 0.
	KENetwork new: #spatial numberOfContacts: 4 onPopulation: population.
	model population: population.
	
	self assert: (model population graph nodes size) equals: 100.