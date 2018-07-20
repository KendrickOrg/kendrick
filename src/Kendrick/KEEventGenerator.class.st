"
A KEEventGenerator is responsible for generating an event list for each population of the model. The instance of this class is initialized at the beginning of the stochastic simulation.

"
Class {
	#name : #KEEventGenerator,
	#superclass : #KEEntity,
	#category : #'Kendrick-Core'
}

{ #category : #'as yet unclassified' }
KEEventGenerator >> generateEvents: model [
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
]

{ #category : #'as yet unclassified' }
KEEventGenerator >> mergeEventsWithSameActionsIn: eventList [
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

]
