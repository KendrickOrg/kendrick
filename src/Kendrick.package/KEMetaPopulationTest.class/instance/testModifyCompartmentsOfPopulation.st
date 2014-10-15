tests
testModifyCompartmentsOfPopulation
	|population|
	population := KEMetaPopulation new.
	population numberOfSubPopulations: 5.
	population forEachSubPopulation: [ :each| 
		each compartments: #(S I).
		each at: #S put: 1000; at: #I put: 0 ].
   (population at: 1) at: #S put: 999; at: #I put: 1.
	self assert: (population nbOfSubPopulations) equals: 5.
	self assert: (population at: #(0 1)) nbOfSubPopulations equals: 2.
	self assert: ((population at: #(0 1)) at: #S) initialNbIndividuals equals: 999.
	self assert: ((population at: #(0 1)) at: #I) initialNbIndividuals equals: 1.
	self assert: ((population at: #(0 2)) at: #I) initialNbIndividuals equals: 0.