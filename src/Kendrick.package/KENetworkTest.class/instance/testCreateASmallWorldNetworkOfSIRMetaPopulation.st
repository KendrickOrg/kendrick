tests
testCreateASmallWorldNetworkOfSIRMetaPopulation
	|model|
	model := KEModel new.
	model population nodes: 3.
	model population graph nodes: 3 edges: #((1 3) (1 2)) weight: #beta values: 0.02.
	model population forEachNode: [ :node| node compartments: #((S 99) (I 1) (R 0)) defNetwork: #smallworld numberOfContacts: 4 surface: 1. ].
	self assert: (model population graph nodes size) equals: 3.
	self assert: (model population at: #(0 1)) graph nodes size equals: 100.