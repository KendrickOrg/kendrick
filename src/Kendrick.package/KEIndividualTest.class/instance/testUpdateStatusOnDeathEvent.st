tests
testUpdateStatusOnDeathEvent
	|model population|
	model := KEModel new.
	population := KEPopulation new.
	population compartments: #(S I R).
	population at: #S put: 90; at: #I put: 1; at: #R put: 0. 
	model population: population.
	
	model currentSubPopulation: model population.
	(model population indList at: 80) nextStatus: #empty.
	(model population indList at: 80) updateStatus: (model).
	self assert: (model population at: #S) currentNbIndividuals equals: 89.
	self assert: (model population indList at: 80) isAlive equals: false.
	self assert: (model population diedIndList first) equals: 80
	