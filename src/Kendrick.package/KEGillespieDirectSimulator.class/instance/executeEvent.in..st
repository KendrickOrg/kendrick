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
		]

	