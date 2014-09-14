tests
createSIRMetaPopulationModel
	|model population graph|
	model := KEModel new.
	population := KEMetaPopulation new.
	population numberOfSubPopulations: 3.
	population forEachSubPopulation: [ :each| each compartments: #(S I R) ].
	(population at: 1) at: #S put: 9999; at: #I put: 1; at: #R put: 0.
	(population at: 2) at: #S put: 999; at: #I put: 1; at: #R put: 0.
	(population at: 3) at: #S put: 1999; at: #I put: 1; at: #R put: 0.
	population addParameter: #mu value: { 365/30 . 1/20 . 1/20 }.
	population addParameter: #N value: { 10000 . 1000 . 2000 }.
	
	graph := KEGraph on: population.
	graph edges: #((1 2) (1 3)) weight: #beta values: 0.02.
	
	population graph: graph.
	model population: population.
	
	model addParameter: #beta value: 0.0.
	model addParameter: #v value: 52.
	model addEquation: ('S:t=mu*N-beta*S*I-mu*S' parseAsAnEquation).
	model addEquation: ('I:t=beta*S*I-v*I-mu*I' parseAsAnEquation).
	model addEquation: ('R:t=v*I-mu*R' parseAsAnEquation).  
	
	^ model
