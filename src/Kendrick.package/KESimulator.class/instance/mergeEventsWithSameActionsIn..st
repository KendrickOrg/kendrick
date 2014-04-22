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
	"For each event generated from equation, check inter-population interaction, set flag hasInterPopInteraction is true or false for this event, reformulate rate of event to probability of contact by removing the variable with symbol as fromStatus in rate expression of event"
	^ newList