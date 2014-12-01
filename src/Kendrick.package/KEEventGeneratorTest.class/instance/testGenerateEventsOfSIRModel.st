as yet unclassified
testGenerateEventsOfSIRModel
	|model events eventGenerator|
	model := KEModel new.
	
	model addEquation: ('S:t=-beta*S*I' parseAsAnEquation).
	model addEquation: ('I:t=beta*S*I-gamma*I' parseAsAnEquation).
	model addEquation: ('R:t=gamma*I' parseAsAnEquation).
	
	eventGenerator := KEEventGenerator new.
	events := eventGenerator generateEvents: model.
	self assert: (events size) equals: 2