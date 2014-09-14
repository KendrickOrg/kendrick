tests
createSIRMetaPopulationWithMovementModel
	|model population graph|
	model := KEModel new.
	population := KEMetaPopulation new.
	population forEachSubPopulation: [ :each| each compartments: #(S I) ].
	population forEachSubPopulation: [ :each|
		each at: #S put: 1000; at: #I put: 10
		 ].
	(population at: 1) at: #S put: 1000; at: #I put: 1.
	graph := KEGraph on: population.
	graph edges: #all moveRates: 0.001.
	
	population graph: graph.
	model population: population.
	
   model addParameter: #mu value: 0.0001.
	model addParameter: #beta value: 0.0001.
	model addParameter: #gamma value: 0.1.
	model addParameter: #N value: 10000.
	model addEquation: ('S:t=mu*N - beta*S*I - mu*S' parseAsAnEquation).
	model addEquation: ('I:t=beta*S*I - gamma*I - mu*I' parseAsAnEquation).
	
	^ model  
	
	
	
	
	
