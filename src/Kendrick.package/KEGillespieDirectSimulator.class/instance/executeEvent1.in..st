as yet unclassified
executeEvent1: eventChosen in: cityChosen
	model setPID: cityChosen.
	eventChosen > (eventList size)
	ifTrue: [ 
		((movementEventList at: cityChosen) at: (eventChosen - (eventList size))) executeOn: model 
		 ]
	ifFalse: [ 
		(eventList at: eventChosen) executeOn: model 
		 ]
	