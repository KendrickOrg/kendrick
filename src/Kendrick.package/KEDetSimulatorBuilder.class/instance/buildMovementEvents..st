as yet unclassified
buildMovementEvents: events
	|newList|
	newList := Dictionary new.
	events keysDo: [ :pid| newList at: pid put: (OrderedCollection new) ].
	events keysAndValuesDo: [ :pid :list|
		(newList at: pid) addAll: list. 
		list do: [ :each|
			(newList at: (each toStatus)) add: each
			 ]
		 ].
	^ newList