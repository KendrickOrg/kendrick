acessing
generateEvents: populationID
	|eventList event|
	eventList := OrderedCollection new.
	event := KEEvent new.
	event rate: (self).
	eventList add: event.
	^ eventList