as yet unclassified
testInitNetwork
	|nw|
	nw := KELatticeNetwork new numberOfContacts: 4; population: (KEPopulation new compartments: #((S 19) (I 1))).
	nw initNetworkNodes: 20.
	self assert: (nw nodes size) equals: 20.
	self assert: (nw nodes at: 1) adjacentNodes asArray equals: #(2 5). 
	self assert: (nw nodes at: 2) adjacentNodes asArray equals: #(1 3 6).
	self assert: (nw nodes at: 3) adjacentNodes asArray equals: #(2 4 7).
	self assert: (nw nodes at: 4) adjacentNodes asArray equals: #(3 8).
	self assert: (nw nodes at: 5) adjacentNodes asArray equals: #(1 6 9).
	self assert: (nw population indList at: 1) location equals: #(1 1).
	self assert: (nw population indList at: 2) location equals: #(2 1).
	self assert: (nw population indList at: 4) location equals: #(4 1).
	self assert: (nw population indList at: 8) location equals: #(4 2).
	self assert: (nw population indList at: 5) location equals: #(1 2).