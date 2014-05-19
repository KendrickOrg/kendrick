as yet unclassified
testModifyCompartmentsOfPopulation
	|population|
	population := KEPopulation new.
	population nodes: 5 forEach: [ :node| node compartments: #((S 1000) (I 0)) ].
	(population nodes at: 1) compartments: #((S 999) (I 1)).
	self assert: (population nodes size) equals: 5.
	self assert: (population at: #(0 1)) equals: (population nodes at: 1).
	self assert: (population at: #(0 1)) nodes size equals: 2.
	self assert: ((population at: #(0 1)) at: #S) initialNbIndividuals equals: 999.
	self assert: ((population at: #(0 1)) at: #I) initialNbIndividuals equals: 1.
	self assert: ((population at: #(0 2)) at: #I) initialNbIndividuals equals: 0.