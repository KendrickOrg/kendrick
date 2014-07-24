tests
testMovementEventOnSmallWorldNetwork
	|model|
	model := KEModel new.
	model population nodes: 3.
	model population graph nodes: 3 edges: #((1 3) (1 2)) weight: #beta values: 0.02.
	model population forEachNode: [ :node| node compartments: #((S 99) (I 1) (R 0)) defNetwork: #smallworld numberOfContacts: 4 surface: 1. ].
	model setPID: #(0 1).
	((model population at: #(0 1)) indList at: 80) nextStatus: #(0 2).
	((model population at: #(0 1)) indList at: 80) updateStatus: model.
	self assert: (model population at: #(0 1)) graph emptyNodes size equals: 1.
	self assert: (model population at: #(0 2)) graph nodes size equals: 101.