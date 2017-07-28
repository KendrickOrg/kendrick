as yet unclassified
generateEvents: model
	"This method will generate an event list for each population of the model"
	|events|
	events := OrderedCollection new.
	model equations do: [ :eq| |eventList|
		eventList := eq generateEvents.
		eventList do: [ :anEvent|
			(anEvent hasAnEventWithOppositeRateIn: events)
			ifTrue: [ |e|
				e := anEvent findEventWithOppositeRateIn: events.
				e actions addAll: anEvent actions.
				e mapStatusWith: anEvent
				 ]
			ifFalse: [ events add: anEvent ]
			 ]
		 ].
	events := self mergeEventsWithSameActionsIn: events.
	^ events