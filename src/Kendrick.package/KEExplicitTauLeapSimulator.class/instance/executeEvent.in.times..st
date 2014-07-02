as yet unclassified
executeEvent: eventChosen in: cityChosen times: times
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
			impl arguments at: #times put: times.
			impl performEvent
			 ].
		]
	