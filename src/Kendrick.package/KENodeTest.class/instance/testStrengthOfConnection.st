as yet unclassified
testStrengthOfConnection
	|graph node|
	graph := self createContactNetworkForTestingNodes.
	node := graph atNode: {graph attribute->#A}.
	
	self assert: (node strengthOfConnection: {#region->#B}) equals: 0.001.
	
