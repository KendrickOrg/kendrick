as yet unclassified
testWeight
	|graph node|
	graph := self createCouplingGraphForTestingNodes.
	node := graph nodes at: (Dictionary newFrom: {#region->#A}).
	
	self assert: (node weight) equals: #beta.
		
