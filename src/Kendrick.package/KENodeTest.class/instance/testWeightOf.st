as yet unclassified
testWeightOf
	|graph node|
	graph := self createCouplingGraphForTestingNodes.
	node := (graph nodes select: [:e| e label = #A]) first.
	
	self assert: (node weightOf: #B) equals: 0.001.
	self assert: (node weightOf: #C) equals: 0.001	
