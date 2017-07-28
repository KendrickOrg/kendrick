accessing
hasAnEventWithOppositeRateIn: eventList
	^ eventList anySatisfy: [ :event | event rate negated = self rate ]