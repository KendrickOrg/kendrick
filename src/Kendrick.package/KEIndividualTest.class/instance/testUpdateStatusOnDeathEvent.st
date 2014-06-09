as yet unclassified
testUpdateStatusOnDeathEvent
	|model|
	model := KEModel new.
	model population compartments: #((S 90) (I 1) (R 0)) defNetwork: 'lattice' contact: 4 surface: 1.
	(model population graph indList at: 80) nextStatus: #empty.
	(model population graph indList at: 80) updateStatus: (model population).
	self assert: (model population at: #S) currentNbIndividuals equals: 89.
	self assert: (model population graph indList at: 80) equals: nil
	