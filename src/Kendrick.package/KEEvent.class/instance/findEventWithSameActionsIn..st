accessing
findEventWithSameActionsIn: eventList
	^ eventList detect: [ :event | event actions = actions ] ifNone: [ nil ]