as yet unclassified
testGenerateEvents1
	|model population eventGenerator events|
	model := KEModel new.
	population := KEPopulation new.
	model population: population.
	
	model addEquation: ('S:t=-betaI*S*I-betaH*S*H-betaF*S*F' parseAsAnEquation).
	model addEquation: ('E:t=betaI*S*I+betaH*S*H+betaF*S*F-anpha*E' parseAsAnEquation).
	model addEquation: ('I:t=anpha*E' parseAsAnEquation).
	
	
	eventGenerator := KEEventGenerator new.
	events := eventGenerator generateEvents: model.
	self assert: (events size) equals: 2