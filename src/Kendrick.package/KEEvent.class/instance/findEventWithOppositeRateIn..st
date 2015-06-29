accessing
findEventWithOppositeRateIn: eventList
	^ eventList detect: [ :event | event rate negated = rate ] ifNone: [ nil ]