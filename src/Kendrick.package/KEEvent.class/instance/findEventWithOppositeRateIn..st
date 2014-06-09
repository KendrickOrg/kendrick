accessing
findEventWithOppositeRateIn: eventList
	eventList do: [ :event|
		(event rate negated = self rate) ifTrue: [ ^ event ]
		 ].
	^ nil