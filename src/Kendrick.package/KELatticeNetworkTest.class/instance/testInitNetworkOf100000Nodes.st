as yet unclassified
testInitNetworkOf100000Nodes
	|population nw|
	population := KEMetaPopulation new.
	population compartments: #(S I).
	population at: #S put: 99999; at: #I put: 1.
	nw := KENetwork new: #lattice numberOfContacts: 4 onPopulation: population.
	"nw initLocation."
	self assert: (nw nodes size) equals: 100000.
	 