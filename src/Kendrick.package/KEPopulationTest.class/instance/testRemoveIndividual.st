as yet unclassified
testRemoveIndividual
	|population  |
	population := KEPopulation new.
	population attributes: '{#status: [#S, #I, #R]}'.
	population compartments: (Dictionary newFrom: {(Dictionary newFrom: {#status->#S})->999. (Dictionary newFrom: {#status->#I})->1. (Dictionary newFrom: {#status->#R})->0}).
	population removeIndividual: (population individuals last).
	
	self assert: (population individuals size) equals: 1000.
	self assert: (population diedIndList size) equals: 1.
	self assert: (population individuals last) isAlive equals: false  