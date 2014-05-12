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
	"For each event generated from equation, reformulate rate of event to probability of contact by removing the variable with symbol as fromStatus in rate expression of event and then check inter-population interaction, set flag hasInterPopInteraction is true or false for this event"
	newList do: [ :each|
		each fromStatus ~= #empty ifTrue: [ each rate: (each rate remove: (KEVariable new symbol: each fromStatus)) ].
		"Set interPopInteraction is true or false"
		(each rate checkHasVariable: (model compartmentSymbols)) ifTrue: [ 
			each interPopWeightName: (each rate getParameter: (model parameters)).
			each interRate: (each rate removeIndexedVariable).
			 ].
		  ].
	^ newList