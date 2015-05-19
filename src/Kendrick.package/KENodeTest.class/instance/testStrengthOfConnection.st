as yet unclassified
testStrengthOfConnection
	|graph node|
	graph := self createContactNetworkForTestingNodes.
	node := graph atNode: #A.
	
	self assert: (node strengthOfConnection: {#region->#B}) equals: 0.001.
	
