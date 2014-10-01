tests
createSEIRMeaslesModel
	|model population|
	model := KEModel new.
	population := KEPopulation new.
	population compartments: #(S E I R).
	population at: #S put: 99999; at: #E put: 0; at: #I put: 1; at: #R put: 0.
	model population: population.
	
	model addParameter: #beta value: 0.0000214.
	model addParameter: #gamma value: 0.143.
	model addParameter: #mu value: 0.0000351.
	model addParameter: #sigma value: 0.125.
	model addParameter: #N value: 100000.
	
	model addEquation: ('S:t=mu*N-beta*S*I-mu*S' parseAsAnEquation).
	model addEquation: ('E:t=beta*S*I-sigma*E-mu*E' parseAsAnEquation).
	model addEquation: ('I:t=sigma*E-gamma*I-mu*I' parseAsAnEquation).
	model addEquation: ('R:t=gamma*I-mu*R' parseAsAnEquation).
	
	^ model