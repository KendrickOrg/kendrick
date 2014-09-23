as yet unclassified
createSIRMetaPopulationWithMovementModel
	|model population |
	population := KEMetaPopulation new.
	population numberOfSubPopulations: 3.
	population forEachSubPopulation: [ :each|
		each compartments: #(S I).
		each at: #S put: 1000; at: #I put: 10
		 ].
	
	model := KEModel new.
	model population: population.
	
	^ model  