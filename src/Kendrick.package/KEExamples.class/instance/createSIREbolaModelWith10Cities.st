tests
createSIREbolaModelWith10Cities
	|model population graph |
	model := KEModel new.
	population := KEMetaPopulation new.
	population numberOfSubPopulations: 6.
	population forEachSubPopulation: [ :node|
		node compartments: #(S I R).
		node at: #S put: 1000; at: #I put: 0; at: #R put: 0
		 ].
	(population at: 1) at: #S put: 950; at: #I put: 50; at: #R put: 0.
	graph := KEGraph on: population.
	graph edges: #all moveRates: 0.05.
	model population: population.
	model addParameter: #beta value: 0.0002.
	model addParameter: #gamma value: 0.1.
	
	model addEquation: ('S:t=-beta*S*I' parseAsAnEquation).
	model addEquation: ('I:t=beta*S*I-gamma*I' parseAsAnEquation).
	model addEquation: ('R:t=gamma*I' parseAsAnEquation).
	
	^ model
	
