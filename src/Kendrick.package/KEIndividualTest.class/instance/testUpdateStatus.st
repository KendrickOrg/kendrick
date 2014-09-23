tests
testUpdateStatus
	|model population network |
	model := KEModel new.
	population := KEMetaPopulation new.
	population compartments: #(S I R).
	population at: #S put: 90; at: #I put: 1; at: #R put: 0.
	network := KENetwork new: #lattice numberOfContacts: 4 onPopulation: population.
	model population: population.
	
	model currentPopulationID: (model population indList first populationID).
	(model population indList at: 80) nextStatus: #I.
	(model population indList at: 80) updateStatus: model.
	self assert: (model population at: #S) currentNbIndividuals equals: 89.
	self assert: (model population at: #I) currentNbIndividuals equals: 2.
	self assert: (model population indList at: 80) currentStatus equals: #I
	