tests
createSIRSimpleModel
	|model population|
	model := KEModel new.
	population := KEPopulation new compartments: #(S I R).
	population at: #S put: 99999; at: #I put: 1; at: #R put: 0.
	model population: population.
	
	model addParameter: #beta value: 0.0052.
	model addParameter: #gamma value: 52.
	
	model addEquation: ('S:t=-beta*S*I' parseAsAnEquation).
	model addEquation: ('I:t=beta*S*I-gamma*I' parseAsAnEquation).
	model addEquation: ('R:t=gamma*I' parseAsAnEquation).
	
	^ model
	