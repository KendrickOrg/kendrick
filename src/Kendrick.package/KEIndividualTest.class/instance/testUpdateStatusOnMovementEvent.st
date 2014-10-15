tests
testUpdateStatusOnMovementEvent
	|model population|
	model := KEModel new.
	population := KEMetaPopulation new.
	population numberOfSubPopulations: 5.
	population forEachSubPopulation: [ :each|
		each compartments: #(S I).
		each at: #S put: 1000; at: #I put: 0.
		 ].
	model population: population.
	model currentSubPopulation: model subPopulations first.
	((model subPopulations first) individuals at: 80) nextStatus: (model subPopulations second).
	((model subPopulations first) individuals at: 80) updateStatus: model.
	self assert: ((model subPopulations second) at: #S) currentNbIndividuals equals: 1001.
	self assert: ((model subPopulations first) at: #S) currentNbIndividuals equals: 999.
	self assert: (model subPopulations first individuals at: 80) isAlive equals: false.
	self assert: (model subPopulations first) diedIndList first equals: 80. 
	self assert: ((model subPopulations second) individuals at: 80) isAlive equals: true.

	