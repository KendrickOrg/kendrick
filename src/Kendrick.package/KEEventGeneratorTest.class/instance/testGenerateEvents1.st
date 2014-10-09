as yet unclassified
testGenerateEvents1
	|model population eventGenerator|
	model := KEModel new.
	population := KEPopulation new.
	model population: population.
	
	model addEquation: ('S:t=-betaI*S*I-betaH*S*H-betaF*S*F' parseAsAnEquation).
	model addEquation: ('E:t=betaI*S*I+betaH*S*H+betaF*S*F-anpha*E' parseAsAnEquation).
	model addEquation: ('I:t=anpha*E' parseAsAnEquation).
	
	
	eventGenerator := KEEventGenerator new.
	eventGenerator generateEvents: model.
	self assert: (model population events size) equals: 2