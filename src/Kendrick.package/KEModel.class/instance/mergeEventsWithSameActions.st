as yet unclassified
mergeEventsWithSameActions
	|oldList|
	oldList := eventList.
	oldList do: [:each|
		|e|
		eventList remove: each.
		e := each findEventWithSameActionsIn: eventList.
		e ifNil: [eventList add: each] 
		ifNotNil: [
			|oldRate|
			oldRate := e rate.
			e rate: ((KEBinaryExpression new) op: #+; leftHandSide: each rate; rightHandSide: oldRate)
			]
		].
	^ eventList

	