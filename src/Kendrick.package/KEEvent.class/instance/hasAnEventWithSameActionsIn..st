accessing
hasAnEventWithSameActionsIn: eventList
	^ eventList anySatisfy: [ :event | event actions = self actions ]