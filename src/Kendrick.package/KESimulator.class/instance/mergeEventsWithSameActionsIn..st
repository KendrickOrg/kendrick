accessing
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
		ifFalse: [ newList add: event ]
		 ].
	newList do: [ :each|
		"each fromStatus ~= #empty ifTrue: [ each rate: (each rate remove: (KEVariable new symbol: each fromStatus)) ]."
		each rate: (each rate remove: (KEVariable new symbol: each fromStatus)).
		"(each rate checkHasVariable: (model compartmentSymbols)) ifTrue: ["
		"(each checkHasContact: (model compartmentSymbols)) ifTrue: [   
			each weight: (each rate getParameter: (model parameters)).
			each interRate: (each rate removeIndexedVariable).
			 ]."
		  ].
	"^ newList"
	^ self checkCouplingEvents: newList