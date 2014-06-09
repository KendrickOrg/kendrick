tests
testNbOfEventsOfSIRModel
	|model simulator eventList|
	model := KEModel new.
	model addEquation: ('S:t=-beta*S*I' parseAsAnEquation).
	model addEquation: ('I:t=beta*S*I-gamma*I' parseAsAnEquation).
	model addEquation: ('R:t=gamma*I' parseAsAnEquation).
	simulator := (KESimulator new) model: model.
	eventList := simulator generateEvents.
	self assert: eventList size equals: 2.