"
A KEEvent is an event generated from an ode of epidemiological model.

Instance Variables
	actions:		<Dictionary>
	fromStatus:		<Symbol>
	rate:		<KEExpression>
	toStatus:		<Symbol>

actions
	- a list of actions that shows how the event affect on model

fromStatus
	- The current status taken by the event

rate
	- The expression represent the probabiity that the event will be occured

toStatus
	- The status after event executed

"
Class {
	#name : #KEEvent,
	#superclass : #KEEntity,
	#instVars : [
		'rate',
		'actions',
		'fromStatus',
		'toStatus'
	],
	#category : 'Kendrick-Semantic-Model-Core'
}

{ #category : #accessing }
KEEvent >> actions [
	^ actions
]

{ #category : #accessing }
KEEvent >> actions: aDictionary [
	actions := aDictionary
]

{ #category : #accessing }
KEEvent >> addOneIndividualTo: aStatus [
	actions at: aStatus put: 1.
]

{ #category : #accessing }
KEEvent >> findEventWithOppositeRateIn: eventList [
	^ eventList detect: [ :event | event rate negated = rate ] ifNone: [ nil ]
]

{ #category : #accessing }
KEEvent >> findEventWithSameActionsIn: eventList [
	^ eventList detect: [ :event | event actions = actions ] ifNone: [ nil ]
]

{ #category : #accessing }
KEEvent >> fromStatus [
	^ fromStatus
]

{ #category : #accessing }
KEEvent >> fromStatus: anObject [
	fromStatus := anObject
]

{ #category : #accessing }
KEEvent >> hasAnEventWithOppositeRateIn: eventList [
	^ eventList anySatisfy: [ :event | event rate negated = self rate ]
]

{ #category : #accessing }
KEEvent >> hasAnEventWithSameActionsIn: eventList [
	^ eventList anySatisfy: [ :event | event actions = self actions ]
]

{ #category : #initialization }
KEEvent >> initialize [
	super initialize.
	actions := Dictionary new.
	rate := nil.
	toStatus := #empty.
	fromStatus := #empty
]

{ #category : #accessing }
KEEvent >> mapStatusWith: anEvent [
	"This function will map fromStatus and toStatus to ones of anEvent"
	(fromStatus = #empty) & (anEvent fromStatus ~= #empty) ifTrue: [ fromStatus := anEvent fromStatus ].
	(toStatus = #empty) & (anEvent toStatus ~= #empty) ifTrue: [ toStatus := anEvent toStatus ]
]

{ #category : #printing }
KEEvent >> printOn: aStream [
	aStream
		nextPutAll: fromStatus asString;
		nextPutAll: '-->';
		nextPutAll: toStatus asString;
		nextPutAll: ': ';
		nextPutAll: rate asString
]

{ #category : #accessing }
KEEvent >> rate [
	^ rate
]

{ #category : #accessing }
KEEvent >> rate: anObject [
	rate := anObject
]

{ #category : #accessing }
KEEvent >> removeOneIndividualFrom: aStatus [
	actions at: aStatus put: -1.
]

{ #category : #accessing }
KEEvent >> toStatus [
	^ toStatus
]

{ #category : #accessing }
KEEvent >> toStatus: anObject [
	toStatus := anObject
]
