tests
testMovementEventOnSpatialNetwork
	|model population graph pop1 nodeID node count status|
	model := KEModel new.
	population := KEMetaPopulation new.
	population numberOfSubPopulations: 3.
	population forEachSubPopulation: [ :each|
		each compartments: #(S I R).
		each at: #S put: 99; at: #I put: 1; at: #R put: 0.
		KENetwork new: #spatial numberOfContacts: 4 onPopulation: each.
		 ].
	graph := KEGraph on: population.
	graph edges: #((1 2) (1 3)) weight: #beta values: 0.02.
	model population: population.
	model currentSubPopulation: model subPopulations first.
	pop1 := model subPopulations first.
	nodeID := self getANodeHasContacts: (pop1 graph).
	node := pop1 graph nodes at: ((pop1 graph nodes at: nodeID) adjacentNodes first).
	status := (pop1 indList at: nodeID) currentStatus.
	count := node at: status.
	(pop1 indList at: nodeID) nextStatus: (model subPopulations second).
	(pop1 indList at: nodeID) updateStatus: model.
	
	self assert: ((model subPopulations second) at: status) currentNbIndividuals equals: 100.
	self assert: ((model subPopulations first) at: status) currentNbIndividuals equals: 98.
	self assert: ((model subPopulations first) indList at: nodeID) isAlive equals: false.
	self assert: (model subPopulations first) diedIndList first equals: nodeID. 
	self assert: ((model subPopulations second) indList at: nodeID) isAlive equals: true.
	self assert: (model subPopulations first) graph nodes size equals: 100.
	self assert: (model subPopulations second) graph nodes size equals: 101.
	
	self assert: (node at: status) equals: (count - 1).