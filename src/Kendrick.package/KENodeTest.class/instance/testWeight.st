as yet unclassified
testWeight
	|graph node|
	graph := self createCouplingGraphForTestingNodes.
	node := (graph nodes select: [:e| e label = #A]) first.
	
	self assert: (node weight) equals: #beta.
		
