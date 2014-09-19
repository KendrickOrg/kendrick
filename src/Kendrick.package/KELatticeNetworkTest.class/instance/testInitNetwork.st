as yet unclassified
testInitNetwork
	|population nw|
	population := KEMetaPopulation new.
	population compartments: #(S I).
	population at: #S put: 19; at: #I put: 1.
	nw := KENetwork new: #lattice numberOfContacts: 4 onPopulation: population.

	self assert: (nw nodes size) equals: 20.
	self assert: (nw nodes at: 1) adjacentNodes asArray equals: #(2 5). 
	self assert: (nw nodes at: 2) adjacentNodes asArray equals: #(1 3 6).
	self assert: (nw nodes at: 3) adjacentNodes asArray equals: #(2 4 7).
	self assert: (nw nodes at: 4) adjacentNodes asArray equals: #(3 8).
	self assert: (nw nodes at: 5) adjacentNodes asArray equals: #(1 6 9).
	self assert: (nw population indList at: 1) position equals: #(1 1).
	self assert: (nw population indList at: 2) position equals: #(2 1).
	self assert: (nw population indList at: 4) position equals: #(4 1).
	self assert: (nw population indList at: 8) position equals: #(4 2).
	self assert: (nw population indList at: 5) position equals: #(1 2).