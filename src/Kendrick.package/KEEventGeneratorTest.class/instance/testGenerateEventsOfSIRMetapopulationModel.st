as yet unclassified
testGenerateEventsOfSIRMetapopulationModel
	|model events eventGenerator|
	model := KEModel new.
	
	model addEquation: ('S:t=mu*N-beta*S*I-mu*S').
	model addEquation: ('I:t=beta*S*I-v*I-mu*I').
	model addEquation: ('R:t=v*I-mu*R').  
	
	eventGenerator := KEEventGenerator new.
	events := eventGenerator generateEvents: model.
	self assert: (events size) equals: 6.