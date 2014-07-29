tests
createSIRSimpleModel2
	|model|
	model := KEModel new.
	model population compartments: #(S I R).
	model population at: #S put: 4975; at: #I put: 25; at: #R put: 0.
	
	model addParameter: #beta value: 1.
	model addParameter: #gamma value: 0.1.
	model addParameter: #mu value: 5e-4.
	model addParameter: #N value: 5000.
	
	model addEquation: ('S:t=mu*N-beta*S*I/N-mu*S' parseAsAnEquation).
	model addEquation: ('I:t=beta*S*I/N-gamma*I-mu*I' parseAsAnEquation).
	model addEquation: ('R:t=gamma*I-mu*R' parseAsAnEquation).
	
	^ model
	
