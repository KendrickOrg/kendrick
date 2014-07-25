as yet unclassified
testInitNetworkOf100000Nodes
	|nw|
	nw := KELatticeNetwork new numberOfContacts: 4; surface: 1; population: (KEPopulation new compartments: #((S 99999) (I 1))).
	nw initNetworkNodes: 100000.
	"nw initLocation."
	self assert: (nw nodes size) equals: 100000.
	 