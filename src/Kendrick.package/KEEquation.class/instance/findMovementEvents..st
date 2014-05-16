as yet unclassified
findMovementEvents: eventList
	movementEvents := Dictionary new.
	eventList keysDo: [ :each|
		movementEvents at: each put: (OrderedCollection new).
		 ].
	eventList keysAndValuesDo: [ :pid :events|
		events do: [ :each|
			(each compartment = variable symbol) ifTrue: [ (movementEvents at: pid) add: each ]
			 ]
		 ]