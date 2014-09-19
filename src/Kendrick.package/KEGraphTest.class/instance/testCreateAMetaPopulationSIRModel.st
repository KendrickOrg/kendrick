tests
testCreateAMetaPopulationSIRModel
	|model population graph|
	model := KEModel new.
	population := KEMetaPopulation new.
	population numberOfSubPopulations: 3.
	population forEachSubPopulation: [ :each| each compartments: #(S I R) ].
	(population at: 1) at: #S put: 9999; at: #I put: 1; at: #R put: 0.
	(population at: 2) at: #S put: 999; at: #I put: 1; at: #R put: 0.
	(population at: 3) at: #S put: 1999; at: #I put: 1; at: #R put: 0.
	graph := KEGraph on: population.
	graph edges: #((1 2) (1 3)) weight: #beta values: 0.02.
	model population: population.
	
	self assert: model population graph nodes size equals: 3.
	self assert: ((model population graph nodes at: 1) weight: #beta of: 2) equals: 0.02. 
	self assert: ((model population graph nodes at: 2) weight: #beta of: 2) equals: 0. 
	self assert: ((model population graph nodes at: 2) weight: #beta of: 1) equals: 0.02