tests
testDeathEventOnSpatialNetwork
	|model population  node countContactOfNode |
	model := KEModel new.
	population := KEMetaPopulation new.
	population compartments: #(S I R).
	population at: #S put: 90; at: #I put: 1; at: #R put: 0.
	KENetwork new: #spatial numberOfContacts: 4 onPopulation: population.
	model population: population.
	
	self assert: (model population graph nodes size) equals: 91.
	model currentSubPopulation: (model population).
	node := (model population graph nodes at: (model population graph nodes at: 80) adjacentNodes first).
	countContactOfNode := node at: #S.
	(model population individuals at: 80) nextStatus: #empty.
	(model population individuals at: 80) updateStatus: model.
	self assert: (model population individuals at: 80) isAlive equals: false.
	self assert: (model population diedIndList first) equals: 80.
	self assert: (model population graph nodes size) equals: 91.
	self assert: (node at: #S) equals: (countContactOfNode - 1)