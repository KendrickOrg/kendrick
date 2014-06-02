as yet unclassified
testMovementEventOnLatticeNetwork
	|model|
	model := KEModel2 new.
	model population nodes: 3 edges: #((1 3) (1 2)) weight: #beta values: 0.02.
	model population forEachNode: [ :node| node compartments: #((S 99) (I 1) (R 0)) defNetwork: 'lattice' contact: 4 surface: 1. ].
	((model population at: #(0 1)) graph indList at: 80) moveTo: (model population at: #(0 2)).
	(model population at: #(0 1)) graph releaseRoom: 80.
	self assert: (model population at: #(0 1)) graph emptyRooms size equals: 1.
	self assert: (model population at: #(0 2)) graph nodes size equals: 101.