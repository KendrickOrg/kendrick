as yet unclassified
testUpdateIndividual
	|population ind |
	population := KEPopulation new.
	population compartments: (Dictionary newFrom: {(Dictionary newFrom: {#status->#S})->999. (Dictionary newFrom: {#status->#I})->1. (Dictionary newFrom: {#status->#R})->0}).
	ind := population individuals last.
	ind nextStatus: (Dictionary newFrom: {#status->#R}).
	population updateIndividual: ind.
	self assert: (population individuals size) equals: 1000.
	self assert: (population individuals last) nextStatus equals: nil.
	self assert: ((population individuals last) currentStatus at: #status) equals: #R