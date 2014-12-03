as yet unclassified
testWeightOf
	|graph node|
	graph := self createCouplingGraphForTestingNodes.
	node := graph nodes at: (Dictionary newFrom: {#region->#A}).
	
	self assert: (node weightOf: (Dictionary newFrom: {#region->#A})) equals: 0.0.
	self assert: (node weightOf: (Dictionary newFrom: {#region->#B})) equals: 0.02	
