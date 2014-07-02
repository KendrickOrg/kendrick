as yet unclassified
testUpdateStatusOnDeathEvent
	|model|
	model := KEModel new.
	model population compartments: #((S 90) (I 1) (R 0)) defNetwork: 'lattice' contact: 4 surface: 1.
	model setPID: (model population indList first pid).
	(model population indList at: 80) nextStatus: #empty.
	(model population indList at: 80) updateStatus: (model).
	self assert: (model population at: #S) currentNbIndividuals equals: 89.
	self assert: (model population indList at: 80) isAlive equals: false
	