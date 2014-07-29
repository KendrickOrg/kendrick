tests
createSIRModelWithDemography
	|model population|
	model := KEModel new.
	population := KEPopulation new.
	population compartments: #(S I R).
	population at: #S put: 99999; at: #I put: 1; at: #R put: 0.
	
	model addParameter: #beta value: 0.0052.
	model addParameter: #gamma value: 52.
	model addParameter: #N value: 100000.
	model addParameter: #mu value: 0.0125. 
	
	model addEquation: ('S:t=mu*N-beta*S*I-mu*I' parseAsAnEquation).
	model addEquation: ('I:t=beta*S*I-gamma*I-mu*I' parseAsAnEquation).
	model addEquation: ('R:t=gamma*I-mu*R' parseAsAnEquation).
	
	^ model
	
