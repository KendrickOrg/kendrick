as yet unclassified
generateEvents: population
	|eventList|
	eventList := OrderedCollection new.
	eventList addAll: (movementExpressions at: population name).
	^ eventList 