as yet unclassified
createAMetaPopulationModel
	|model population graph|
	model := KEModel new.
	population := KEMetaPopulation new.
	population numberOfSubPopulations: 3.
	population forEachSubPopulation: [ :each|
		each compartments: #(S I R).
		each at: #S put: 1000; at: #I put: 1; at: #R put: 0
		 ].
	graph := KEGraph on: population.
	graph edges: #((1 2) (1 3)) weight: #beta values: 0.02.
	
	model population: population.
	model addEquation: 'S:t=-beta*S*I' parseAsAnEquation.
	model addEquation: 'I:t=beta*S*I-gamma*I' parseAsAnEquation.
	model addEquation: 'R:t=gamma*I' parseAsAnEquation.
	
	model addParameter: #beta value: 0.0.
	model addParameter: #gamma value: 0.05.
	^ model