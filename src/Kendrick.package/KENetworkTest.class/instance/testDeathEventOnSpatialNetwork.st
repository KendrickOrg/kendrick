tests
testDeathEventOnSpatialNetwork
	|model population stt|
	model := KEModel new.
	population := KEMetaPopulation new.
	population compartments: #(S I R).
	population at: #S put: 90; at: #I put: 1; at: #R put: 0.
	KENetwork new: #spatial numberOfContacts: 4 onPopulation: population.
	model population: population.
	
	self assert: (model population graph nodes size) equals: 91.
	stt := model population graph releaseNode: (model population indList at: 80).
	(model population at: stt) removeFromCompartment: 1.
	self assert: (model population graph nodes size) equals: 91.
	self assert: (model population graph emptyNodes size) equals: 1.