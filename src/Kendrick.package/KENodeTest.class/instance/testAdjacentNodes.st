as yet unclassified
testAdjacentNodes
	|graph node|
	graph := self createContactNetworkForTestingNodes.
	node := graph atNode: #A.
	
	self assert: (node adjacentNodes size) equals: 2.
	