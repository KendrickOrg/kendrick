as yet unclassified
testAdjacentNodes
	|graph node|
	graph := self createCouplingGraphForTestingNodes.
	node := graph nodes at: (Dictionary newFrom: {#region->#A}).
	
	self assert: (node adjacentNodes size) equals: 3 