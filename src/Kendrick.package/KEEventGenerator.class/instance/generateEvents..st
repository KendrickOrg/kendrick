as yet unclassified
generateEvents: model
	"This method will generate an event list for each population of the model"
	|events|
	model populationIDs do: [ :pid| 
		events := OrderedCollection new.
		model equations do: [ :eq| |eventList|
			eventList := eq generateEvents: pid.
			eventList do: [ :anEvent|
				(anEvent hasAnEventWithOppositeRateIn: events)
				ifTrue: [ |e|
					e := anEvent findEventWithOppositeRateIn: events.
					e actions addAll: anEvent actions.
					e mapStatusWith: anEvent
					 ]
				ifFalse: [ events add: anEvent ]
				 ].
			 ].
		(model population at: pid) events: (self mergeEventsWithSameActionsIn: events)
		 ].
	events := (model population at: (model populationIDs first)) events.
	^ events