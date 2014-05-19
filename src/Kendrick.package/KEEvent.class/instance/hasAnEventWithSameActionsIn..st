accessing
hasAnEventWithSameActionsIn: eventList
	eventList do: [ :each|
		(each actions = self actions) ifTrue: [ ^ true ]
		 ].
	^ false