as yet unclassified
testCreateNewPopulationForMultiSpeciesModel
	|population|
	population := KEMetaPopulation new.
	population subPopulations: #($a $b $c).
	population subPopulations do: [ :each| each compartments: #(S I R) ].
	(population at: $a) at: #S put: 9999; at: #I put: 1; at: #R put: 0.
	(population at: $b) at: #S put: 1000; at: #I put: 0; at: #R put: 0.
	(population at: $c) at: #S put: 2000; at: #I put: 0; at: #R put: 0.
	
	self assert: (population subPopulations size) equals: 3.
	self assert: (population at: 1) isPopulation equals: true.
	self assert: (population at: 1) getNbIndividuals equals: 10000.
	self assert: ((population at: $a) getNbIndividualsOfCompartment: #S) equals: 9999.
	