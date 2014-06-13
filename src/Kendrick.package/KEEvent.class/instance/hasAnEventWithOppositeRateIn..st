accessing
hasAnEventWithOppositeRateIn: eventList
	eventList do: [ :event|
		(event rate negated = self rate) ifTrue: [ ^ true ]
		 ].
	^ false