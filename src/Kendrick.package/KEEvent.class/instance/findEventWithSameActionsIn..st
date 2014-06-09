accessing
findEventWithSameActionsIn: eventList
	eventList do: [ :event|
		(event actions = self actions) ifTrue: [ ^ event ]
		 ].
	^ nil