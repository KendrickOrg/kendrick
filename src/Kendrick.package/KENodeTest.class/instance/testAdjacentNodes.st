as yet unclassified
testAdjacentNodes
	|graph node|
	graph := self createCouplingGraphForTestingNodes.
	node := (graph nodes select: [:e| e label = #A]) first.
	
	self assert: (node adjacentNodes size) equals: 2.
	self assert: (node adjacentNodes at: #B) first equals: (#beta->0.001)