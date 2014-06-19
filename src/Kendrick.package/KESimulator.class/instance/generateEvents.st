accessing
generateEvents
	"This function will generate a list of events based on the equation system of model"
	|eventList|
	eventList := OrderedCollection new.
	model equations do: [ :eq| |eachList|
		eachList := eq generateEvents.
		eachList do: [ :anEvent|
			(anEvent hasAnEventWithOppositeRateIn: eventList)
			ifTrue: [ |e|
				e := anEvent findEventWithOppositeRateIn: eventList.
				e actions addAll: anEvent actions.
				e mapStatusWith: anEvent
				 ]
			ifFalse: [ eventList add: anEvent ]
			 ]
		 ].
	^ self mergeEventsWithSameActionsIn: eventList