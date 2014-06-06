tests
createSIRSimpleModel5
	|model|
	model := KEModel new.
	model population compartments: #((S 996) (I 4) (R 0)).
	
	model addParameter: #beta value: 0.01.
	model addParameter: #gamma value: 0.5.
	
	model addEquation: ('S:t=-beta*S*I' parseAsAnEquation).
	model addEquation: ('I:t=beta*S*I-gamma*I' parseAsAnEquation).
	model addEquation: ('R:t=gamma*I' parseAsAnEquation).
	
	^ model
	
