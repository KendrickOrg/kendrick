as yet unclassified
mergeEventsWithSameActionsIn: eventList
	"This function will find all events with same actions and merge their rate in one event"
	|newList|
	newList := OrderedCollection new.
	eventList do: [ :event|
		(event hasAnEventWithSameActionsIn: newList)
		ifTrue: [ |e|
			e := event findEventWithSameActionsIn: newList.
			e rate: ((KEBinaryExpression new) op: #+; leftHandSide: (e rate); rightHandSide: (event rate))
			 ]
		ifFalse: [ newList add: event ].
		 ].
	newList do: [ :each|
		(each fromStatus = #empty) 
		"ifTrue: [
			each rate: (each rate remove: (KEVariable new symbol: #N)) ]"
		ifFalse: [ each rate: (each rate remove: (KEVariable new symbol: each fromStatus)) ]
		 ].
	^ newList
