tests
testDeathEventOnSpatialNetwork
	|model population  node countContactOfNode nodeID |
	model := KEModel new.
	population := KEMetaPopulation new.
	population compartments: #(S I R).
	population at: #S put: 90; at: #I put: 1; at: #R put: 0.
	KENetwork new: #spatial numberOfContacts: 4 onPopulation: population.
	model population: population.
	
	self assert: (model population graph nodes size) equals: 91.
	model currentSubPopulation: (model population).
	nodeID := self getANodeHasContacts: population graph.
	node := (model population graph nodes at: (model population graph nodes at: nodeID) adjacentNodes first).
	countContactOfNode := node at: #S.
	(model population indList at: nodeID) nextStatus: #empty.
	(model population indList at: nodeID) updateStatus: model.
	self assert: (model population indList at: nodeID) isAlive equals: false.
	self assert: (model population diedIndList first) equals: nodeID.
	self assert: (model population graph nodes size) equals: 91.
	self assert: (node at: #S) equals: (countContactOfNode - 1)