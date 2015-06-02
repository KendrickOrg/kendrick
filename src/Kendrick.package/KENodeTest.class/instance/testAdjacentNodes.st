as yet unclassified
testAdjacentNodes
	|graph node|
	graph := self createContactNetworkForTestingNodes.
	node := graph atNode: {graph attribute->#A}.
	
	self assert: (node adjacentNodes size) equals: 2.
	