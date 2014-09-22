as yet unclassified
testGenerateEventsOfSIRModel
	|model population eventGenerator|
	model := KEModel new.
	population := KEPopulation new compartments: #(S I R).
	population at: #S put: 99999; at: #I put: 1; at: #R put: 0.
	model population: population.
	
	model addEquation: ('S:t=-beta*S*I' parseAsAnEquation).
	model addEquation: ('I:t=beta*S*I-gamma*I' parseAsAnEquation).
	model addEquation: ('R:t=gamma*I' parseAsAnEquation).
	
	eventGenerator := KEEventGenerator new.
	eventGenerator generateEvents: model.
	self assert: (model population events size) equals: 2