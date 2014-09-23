as yet unclassified
testGenerateEventsOfSIRMetapopulationModel
	|model population eventGenerator|
	model := KEModel new.
	population := KEMetaPopulation new.
	population numberOfSubPopulations: 3.
	population forEachSubPopulation: [ :each| each compartments: #(S I R) ].
	(population at: 1) at: #S put: 9999; at: #I put: 1; at: #R put: 0.
	(population at: 2) at: #S put: 999; at: #I put: 1; at: #R put: 0.
	(population at: 3) at: #S put: 1999; at: #I put: 1; at: #R put: 0.
	model population: population.
	
	model addEquation: ('S:t=mu*N-beta*S*I-mu*S' parseAsAnEquation).
	model addEquation: ('I:t=beta*S*I-v*I-mu*I' parseAsAnEquation).
	model addEquation: ('R:t=v*I-mu*R' parseAsAnEquation).  
	
	eventGenerator := KEEventGenerator new.
	eventGenerator generateEvents: model.
	self assert: ((model population at: #(0 1)) events size) equals: 6.
	self assert: ((model population at: #(0 2)) events size) equals: 6.
	self assert: ((model population at: #(0 3)) events size) equals: 6.