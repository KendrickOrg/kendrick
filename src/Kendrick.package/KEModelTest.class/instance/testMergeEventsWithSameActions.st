as yet unclassified
testMergeEventsWithSameActions
	
	|model eventList|
	model := KEModel new.
	model addEquation: 'S:t=(A+B)*C-D*E' parseAsAnEquation.
	model addEquation: 'I:t=(D+G)*E-(F+K)*H' parseAsAnEquation.
	model addEquation: 'R:t=K*H' parseAsAnEquation.
	
	eventList := model generateEvents.
	self assert: 6 equals: eventList size.
	eventList := model mergeEventsWithSameActions.	
	self assert: 5 equals: eventList size.
	