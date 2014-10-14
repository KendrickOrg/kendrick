tests
testMovementEventOnSpatialNetwork
	|model population graph node1 count1 |
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
	node1 := ((model subPopulations first) graph nodes at: ((model subPopulations first) graph nodes at: 80) adjacentNodes first). 
	count1 := node1 at: #S.
	((model subPopulations first) indList at: 80) nextStatus: (model subPopulations second).
	(model subPopulations first indList at: 80) updateStatus: model.
	
	self assert: ((model subPopulations second) at: #S) currentNbIndividuals equals: 100.
	self assert: ((model subPopulations first) at: #S) currentNbIndividuals equals: 98.
	self assert: ((model subPopulations first) indList at: 80) isAlive equals: false.
	self assert: (model subPopulations first) diedIndList first equals: 80. 
	self assert: ((model subPopulations second) indList at: 80) isAlive equals: true.
	self assert: (model subPopulations first) graph nodes size equals: 100.
	self assert: (model subPopulations second) graph nodes size equals: 101.
	
	self assert: (node1 at: #S) equals: (count1 - 1).