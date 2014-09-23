tests
testUpdateStatusOnDeathEvent
	|model|
	model := KEModel new.
	model population compartments: #((S 90) (I 1) (R 0)) defNetwork: 'lattice' numberOfContacts: 4.
	model currentPopulationID: (model population indList first populationID).
	(model population indList at: 80) nextStatus: #empty.
	(model population indList at: 80) updateStatus: (model).
	self assert: (model population at: #S) currentNbIndividuals equals: 89.
	self assert: (model population indList at: 80) isAlive equals: false
	