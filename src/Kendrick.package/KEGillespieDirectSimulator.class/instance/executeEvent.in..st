as yet unclassified
executeEvent: eventChosen in: cityChosen
	"Get exact eventChosen for each eventImpl"
	|e|
	e := eventChosen.
	self rtImpls do: [ :impl|
		e > (impl events size) 
		ifTrue: [ 
			e := eventChosen - (impl events size)
			 ]
		ifFalse: [ 
			impl arguments at: #eventChosen put: e.
			impl arguments at: #cityChosen put: cityChosen.
			impl performEvent
			 ].
		].
	"
	eventChosen > (eventList size)
	ifTrue: [ 
		((movementEventList at: cityChosen) at: (eventChosen - (eventList size))) executeOn: model 
		 ]
	ifFalse: [ 
		(eventList at: eventChosen) executeOn: model 
		 ]"
	