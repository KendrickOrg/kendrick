as yet unclassified
testGenerateEventsOfSIRModel
	|model events eventGenerator|
	model := KEModel new.
	
	model addEquation: ('S:t=-beta*S*I').
	model addEquation: ('I:t=beta*S*I-gamma*I').
	model addEquation: ('R:t=gamma*I').
	
	eventGenerator := KEEventGenerator new.
	events := eventGenerator generateEvents: model.
	self assert: (events size) equals: 2