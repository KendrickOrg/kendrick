tests
createSIRSimpleModel3
	|model|
	model := KEModel new.
	model population compartments: #(S I R).
	model population at: #S put: 99; at: #I put: 1; at: #R put: 0.
	
	model addParameter: #beta value: 0.01.
	model addParameter: #gamma value: 0.1.
	
	model addEquation: ('S:t=-beta*S*I' parseAsAnEquation).
	model addEquation: ('I:t=beta*S*I-gamma*I' parseAsAnEquation).
	model addEquation: ('R:t=gamma*I' parseAsAnEquation).
	
	^ model
	
