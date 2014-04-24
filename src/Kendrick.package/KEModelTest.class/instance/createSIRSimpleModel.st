tests
createSIRSimpleModel
	|model|
	model := KEModel2 new.
	model addCompartment: #S numberOfIndividuals: 99999.
	model addCompartment: #I numberOfIndividuals: 1.
	model addCompartment: #R numberOfIndividuals: 0.
	model buildPopulation.
	
	model addParameter: #beta value: 0.0052.
	model addParameter: #gamma value: 52.
	
	model addEquation: ('S:t=-beta*S*I' parseAsAnEquation).
	model addEquation: ('I:t=beta*S*I-gamma*I' parseAsAnEquation).
	model addEquation: ('R:t=gamma*I' parseAsAnEquation).
	
	^ model
	
