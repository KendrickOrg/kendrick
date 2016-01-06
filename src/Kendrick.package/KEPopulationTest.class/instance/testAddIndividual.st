as yet unclassified
testAddIndividual
	|population ind |
	population := KEPopulation new.
	population compartments: (Dictionary newFrom: {(Dictionary newFrom: {#status->#S})->999. (Dictionary newFrom: {#status->#I})->1. (Dictionary newFrom: {#status->#R})->0}).
	ind := KEIndividual new currentStatus: (Dictionary newFrom: {#status->#I}).
	population addIndividual: ind.
	
	self assert: (population individuals size) equals: 1001 