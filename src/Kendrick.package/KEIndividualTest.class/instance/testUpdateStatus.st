tests
testUpdateStatus
	|model|
	model := KEModel new.
	model population compartments: #((S 90) (I 1) (R 0)) defNetwork: 'lattice' numberOfContacts: 4 surface: 1.
	model setPID: (model population indList first pid).
	(model population indList at: 80) nextStatus: #I.
	(model population indList at: 80) updateStatus: model.
	self assert: (model population at: #S) currentNbIndividuals equals: 89.
	self assert: (model population at: #I) currentNbIndividuals equals: 2.
	self assert: (model population indList at: 80) currentStatus equals: #I
	