as yet unclassified
mergeEventsWithSameActions
	|oldList|
	oldList := eventList.
	eventList := Bag new.
	oldList do:[:each|
		(each hasAnEventWithSameActionsIn: eventList)
		ifTrue: [|e oldRate|
			e := each findEventWithSameActionsIn: eventList.
			oldRate := e rate.
			e rate: ((KEBinaryExpression new) op: #+; leftHandSide: (each rate); rightHandSide: oldRate)]
		ifFalse: [eventList add: each]
		].
	^ eventList

	